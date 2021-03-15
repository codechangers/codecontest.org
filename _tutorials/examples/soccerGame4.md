---
title: Add Goals
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 4. Goals
_4.1_ We need to add the goals characters.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.addCharacters('players', 0.6);  // Click here and hit enter
// Then add this new line of code:
	g.addCharacters('goals', 0.6);
}
```
{% capture code %}
	g.addCharacters('goals', 0.6);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.2_ Then we need to upload a goal image ([Need Help?](/tutorials/images/)).

_4.3_ Next we need to load the goal image.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.loadImage('tangles', 'circle5.png'); // Click here and hit enter
// Then add this new line of code:
	g.loadImage('goals', 'goal.png');
}
```
{% capture code %}
	g.loadImage('goals', 'goal.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.4_ Then we need to set the player depth.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.getCharacters('players', (player) => { // Click here and hit enter
	// Then add this new line of code:
		player.sprite.depth = 5;
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	});
```
{% capture code %}
		player.sprite.depth = 5;
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.5_ We also need to get the goals.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.drawBackground('background', 0.8); // Click here and hit enter
// Then add this new line of code:
	g.getCharacters('goals');
```
{% capture code %}
	g.getCharacters('goals');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.6_ In our server code we need to setup the goals.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
	g.setupCharacters('players'); // Click here and hit enter
// Then add this new line of code:
	g.setupCharacters('goals');
}
```
{% capture code %}
	g.setupCharacters('goals');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.7_ Then we need to create each player's goal.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	g.createACharacter('players', client.sessionId, { x, y, ...data }); // Click here and hit enter
// Then add this new line of code:
	g.createACharacter('goals', client.sessionId, { x, y });
```
{% capture code %}
	g.createACharacter('goals', client.sessionId, { x, y });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_4.8_ Finally we need to delete a goal when someone leaves.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
onLeave(client) {
	g.deleteACharacter('players', client.sessionId); // Click here and hit enter
// Then add this new line of code:
	g.deleteACharacter('goals', client.sessionId);
}
```
{% capture code %}
	g.deleteACharacter('goals', client.sessionId);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and each player should now have a goal!**
