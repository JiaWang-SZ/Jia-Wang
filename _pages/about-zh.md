---
permalink: /zh/
title: ""
excerpt: ""
author_profile: true
lang: zh
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

我是 [Xi'an Jiaotong-Liverpool University（西交利物浦大学）](https://www.xjtlu.edu.cn/zh) 的助理教授。

此前，我于 [The Hong Kong Polytechnic University（香港理工大学）](https://www.polyu.edu.hk/tc/) 计算机系获得计算机科学博士学位，师从 [Jiannong Cao（曹建农）](https://www4.comp.polyu.edu.hk/~csjcao/) 教授；硕士毕业于 [KTH Royal Institute of Technology（瑞典皇家理工大学）](https://www.kth.se/en)，师从 [Zhibo Pang（庞智博）](https://amr.pku.edu.cn/jzyg/szdw/P/2a0b83b7eedb480293ee6eccdf490ef7.htm) 教授；本科毕业于北京交通大学通信工程专业。博士期间曾在 [University of Southern California（南加州大学）](https://www.usc.edu/) 交流访问，与 [Yan Liu](https://sites.google.com/view/yanliu-ai/home) 教授开展合作。

我的研究方向包括推荐系统、具身智能与多智能体系统，重点关注构建可控、可信的推荐世界模型与推荐智能体。

{% include_relative includes/news-zh.md %}

{% include_relative includes/pub-zh.md %}

{% include_relative includes/honers-zh.md %}

{% include_relative includes/others-zh.md %}
