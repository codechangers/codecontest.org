---
title: Add More Characters
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 3. Players
_3.1_ We are going to add some character options. The first thing we need to do is upload all of our character images ([Need Help?](/tutorials/images/)).

_3.2_ We need to set the players default image.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.loadImage('players', 'logo.png');
// And change it to say:
	g.loadImage('players', 'circle1.png');
```
{% capture code %}
g.loadImage('players', 'circle1.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_3.3_ Then we will load all of the new images.
```javascript
// In the same file, game.js

// In the same spot:
	g.loadImage('players', 'circle1.png');
	g.loadImage('background', 'grass.jpg'); // Click here and hit enter
// Then add these new lines of code:
	g.loadImage('blobbert', 'circle1.png');
	g.loadImage('grunch', 'circle2.png');
	g.loadImage('neon', 'circle3.png');
	g.loadImage('nimbo', 'circle4.png');
	g.loadImage('tangles', 'circle5.png');
// End of the new code
}
```
{% capture code %}
	g.loadImage('blobbert', 'circle1.png');
	g.loadImage('grunch', 'circle2.png');
	g.loadImage('neon', 'circle3.png');
	g.loadImage('nimbo', 'circle4.png');
	g.loadImage('tangles', 'circle5.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_3.4_ Next we need to add a player select screen.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.useLoginScreen((name) => g.connect({ name }));  // Click here and hit enter
// Then add these new lines of code:
	g.usePlayerSelectScreen({
		blobbert: 'circle1.png',
		grunch: 'circle2.png',
		neon: 'circle3.png',
		nimbo: 'circle4.png',
		tangles: 'circle5.png',
	});
// End of the new code
	g.useHowToScreen('How to play', {
```
{% capture code %}
	g.usePlayerSelectScreen({
		blobbert: 'circle1.png',
		grunch: 'circle2.png',
		neon: 'circle3.png',
		nimbo: 'circle4.png',
		tangles: 'circle5.png',
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_3.5_ After that we need to send the player's choice to the server.
```javascript
// In the same file, game.js

// In the same spot:
// Change this code:
	g.useLoginScreen((name) => g.connect({ name }));
// And make it say this:
	g.useLoginScreen((name, spriteName) => g.connect({ name, spriteName }));
```
{% capture code %}
	g.useLoginScreen((name, spriteName) => g.connect({ name, spriteName }));
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should be able to choose your character!**
