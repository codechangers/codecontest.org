---
title: Build Your Game
tags: [customize]
author: jason
---
<iframe width="560" height="315" src="https://www.youtube.com/embed/9TJwuiQym3E" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% include code.html code=code lang="javascript" %}
{% capture code %}var = jason;{% endcapture %}

{
	"Code Snippet": {
		"prefix": "code",
		"body": [
			"{% capture code %}$1{% endcapture %}",
			"{% include code.html code=code lang=\"$0\" %}"
		]
	}
}
