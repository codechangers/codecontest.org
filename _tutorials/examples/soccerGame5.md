---
title: Add Soccer Balls
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 5. Soccer Balls
_5.1_ First we need to upload the picture of our soccer ball ([Need Help?](/tutorials/images/)).

_5.2_ Then we need to setup the soccer ball characters.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.addCharacters('goals', 0.6); // Click here and hit enter
// Then add this new line of code:
	g.addCharacters('soccerBalls', 0.2);
}
```
{% capture code %}
	g.addCharacters('soccerBalls', 0.2);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_5.3_ Next we need to load the soccer ball image.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.loadImage('goals', 'goal.png'); // Click here and hit enter
// Then add this new line of code:
	g.loadImage('soccerBalls', 'ball.png');
}
```
{% capture code %}
	g.loadImage('soccerBalls', 'ball.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_5.4_ Finally we need to get the soccer balls.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.getCharacters('goals'); // Click here and hit enter
// Then add this new line of code:
	g.getCharacters('soccerBalls');
}
```
{% capture code %}
	g.getCharacters('soccerBalls');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_5.5_ In our server code we need to setup the soccer balls.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
	g.setupCharacters('goals'); // Click here and hit enter
// Then add this new line of code:
	g.setupCharacters('soccerBalls');
}
```
{% capture code %}
	g.setupCharacters('soccerBalls');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_5.6_ Then we need to add a ball.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	g.createACharacter('goals', client.sessionId, { x, y }); // Click here and hit enter
// Then add these new lines of code:
	this.addABall();
```
{% capture code %}
	this.addABall();
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_5.7_ Finally we need to create one ball for every two players.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	g.handleActions(actions, data);
}
// Click on the empty line and press enter
// Then add these new lines of code:
addABall() {
	const playersPerBall = 2;
	const numOf = (t) => Object.keys(this.state[t]).length;
	if (
		numOf('players') % playersPerBall === 0 &&
		numOf('soccerBalls') < numOf('players') / playersPerBall
	) {
		g.createACharacter('soccerBalls',
			g.nextCharacterId('soccerBalls'), {
				x: GAME_WIDTH / 2,
				y: GAME_HEIGHT / 2,
			});
	}
} // Click here and hit enter
// End of the new code
onUpdate(dt) {
```
{% capture code %}
	addABall() {
	const playersPerBall = 2;
	const numOf = (t) => Object.keys(this.state[t]).length;
	if (
		numOf('players') % playersPerBall === 0 &&
		numOf('soccerBalls') < numOf('players') / playersPerBall
	) {
		g.createACharacter('soccerBalls',
			g.nextCharacterId('soccerBalls'), {
				x: GAME_WIDTH / 2,
				y: GAME_HEIGHT / 2,
			});
	}
}
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and a soccer ball should appear once 2 players join!**
