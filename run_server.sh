#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
project_root="$PWD"
compat_shim="$project_root/.ruby_compat/taint_compat.rb"

required_bundler="$(
  ruby -e '
    lock = "Gemfile.lock"
    unless File.exist?(lock)
      exit 0
    end
    lines = File.readlines(lock, chomp: true)
    i = lines.index("BUNDLED WITH")
    puts(lines[i + 1].strip) if i && lines[i + 1]
  '
)"

ruby_api_version="$(ruby -e 'print RbConfig::CONFIG["ruby_version"]')"
export GEM_HOME="${GEM_HOME:-$project_root/.gem/ruby/$ruby_api_version}"
user_gem_home_default="$HOME/.gem/ruby/$ruby_api_version"
user_gem_home_alt="$HOME/.gem/ruby/$(ruby -e 'print RUBY_VERSION')"
export GEM_PATH="${GEM_PATH:-$GEM_HOME:$user_gem_home_default:$user_gem_home_alt}"
export GEM_SPEC_CACHE="${GEM_SPEC_CACHE:-$project_root/.gem/specs}"
export PATH="$GEM_HOME/bin:$user_gem_home_default/bin:$user_gem_home_alt/bin:$PATH"
mkdir -p "$GEM_HOME"
mkdir -p "$GEM_SPEC_CACHE"

# Jekyll 3.x / Liquid 4.x still calls taint APIs removed in modern Ruby.
if ruby -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.2") ? 0 : 1)'; then
  if [[ -f "$compat_shim" ]]; then
    export RUBYOPT="${RUBYOPT:-} -r$compat_shim"
    echo "Applying Ruby compatibility shim for Jekyll on Ruby $(ruby -e 'print RUBY_VERSION')"
  fi
fi

bundle_cmd=(bundle)
if [[ -n "${required_bundler:-}" ]]; then
  if ! gem list -i bundler -v "$required_bundler" >/dev/null 2>&1; then
    echo "Missing bundler $required_bundler. Installing into $GEM_HOME ..."
    if ! gem install bundler -v "$required_bundler"; then
      echo "Primary source failed. Retrying via Ruby China mirror..."
      if ! gem install bundler -v "$required_bundler" --source https://gems.ruby-china.com; then
      cat <<EOF
Failed to install bundler $required_bundler.
If your network needs a proxy, run:
  source ~/.zshrc
  proxy_on
Then run:
  bash run_server.sh
EOF
        exit 1
      fi
    fi
  fi
  bundle_cmd=(bundle "_${required_bundler}_")
fi

if ! "${bundle_cmd[@]}" check; then
  "${bundle_cmd[@]}" config set --local path vendor/bundle
  if ! "${bundle_cmd[@]}" install; then
    cat <<EOF
Failed to install gems from Gemfile.
If your network needs a proxy, run:
  source ~/.zshrc
  proxy_on
Then run:
  bash run_server.sh
EOF
    exit 1
  fi
fi

exec "${bundle_cmd[@]}" exec jekyll serve --livereload
