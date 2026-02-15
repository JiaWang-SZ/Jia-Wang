---
permalink: /
title: ""
excerpt: ""
author_profile: true
lang: en
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

I am an Assistant Professor at [Xi'an Jiaotong-Liverpool University (XJTLU)](https://www.xjtlu.edu.cn/zh).

Previously, I received my Ph.D. in Computer Science from the Department of Computing at [The Hong Kong Polytechnic University](https://www.polyu.edu.hk/tc/), advised by Prof. [Jiannong Cao (曹建农)](https://www4.comp.polyu.edu.hk/~csjcao/). I earned my M.Sc. from [KTH Royal Institute of Technology](https://www.kth.se/en), advised by Prof. [Zhibo Pang (庞智博)](https://amr.pku.edu.cn/jzyg/szdw/P/2a0b83b7eedb480293ee6eccdf490ef7.htm), and my B.Eng. in Communication Engineering from Beijing Jiaotong University. During my doctoral studies, I was a visiting researcher at [University of Southern California (USC)](https://www.usc.edu/), where I collaborated with Prof. [Yan Liu](https://sites.google.com/view/yanliu-ai/home).

My research interests include recommender systems, embodied intelligence, and multi-agent systems, with a particular focus on building controllable and trustworthy recommendation world models and recommendation agents.

{% include_relative includes/news.md %}

{% include_relative includes/pub.md %}

{% include_relative includes/honers.md %}

{% include_relative includes/others.md %}
