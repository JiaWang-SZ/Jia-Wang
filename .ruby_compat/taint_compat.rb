# Compatibility shim for legacy gems (Jekyll 3.x / Liquid 4.x) on Ruby >= 3.2.
# Ruby removed taint/trust APIs, but old code still calls tainted?/taint/untaint.

class Object
  unless method_defined?(:tainted?)
    def tainted?
      false
    end
  end

  unless method_defined?(:taint)
    def taint
      self
    end
  end

  unless method_defined?(:untaint)
    def untaint
      self
    end
  end
end
