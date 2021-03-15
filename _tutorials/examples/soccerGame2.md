---
title: Add a Background
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---
## 2. Background
_2.1_ The first thing we are going to do is upload a background image for our game ([Need Help?](/tutorials/images/)).

_2.2_ Then we will load the image into the game.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
preload() {
	g.loadImage('players', 'logo.png'); // Click here and hit enter
// Then add this new line of code:
	g.loadImage('background', 'grass.jpg');
}
```
{% capture code %}
g.loadImage('background', 'grass.jpg');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_2.3_ After that we will draw the background.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.getCharacters('players', (player) => {
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	}); // Click here and hit enter
// Then add this new line of code:
	g.drawBackground('background', 0.8);
}
```
{% capture code %}
g.drawBackground('background', 0.8);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should have a background!**
