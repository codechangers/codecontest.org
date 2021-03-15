---
title: Add Scoring A Goal
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 7. Score a goal
_7.1_ First we need to add data to the players.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this line of code:
	g.createACharacter('players', client.sessionId, { x, y, ...data });
// And change it to say this:
	g.createACharacter('players', client.sessionId,
		{ ...data, x, y, score: 0, lives: 3, block3s: 0, block5s: 0 });
```
{% capture code %}
	g.createACharacter('players', client.sessionId,
		{ ...data, x, y, score: 0, lives: 3, block3s: 0, block5s: 0 });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_7.2_ Then we need to add a kicker to the ball.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	g.createACharacter('soccerBalls',
		g.nextCharacterId('soccerBalls'), {
			x: GAME_WIDTH / 2,
			y: GAME_HEIGHT / 2,
			dx: 0,
			dy: 0, // Click here and hit enter
		// Then add this new line of code:
			kicker: '',
		});
```
{% capture code %}
		kicker: '',
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_7.3_ Next we need to keep track of who kicked the ball last.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	g.handleCollision('players', 'soccerBalls', (player, ball) => {
		ball.dx = g.getXTowards(player, ball.x, ball.y);
		ball.dy = g.getYTowards(player, ball.x, ball.y); // Click here and hit enter
		// Then add this new line of code:
		ball.kicker = player.id;
	});
```
{% capture code %}
		ball.kicker = player.id;
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_7.4_ Next we need to update the lives and scores when a goal is made.
```javascript
// In the same file, room.js

// In the same spot:
		ball.dy = g.getYTowards(player, ball.x, ball.y);
		ball.kicker = player.id;
	}); // Click here and hit enter
// Then add these new lines of code:
	g.handleCollision('goals', 'soccerBalls', (goal, ball) => {
		if (ball.kicker !== goal.id) {
			g.getACharacter('players', ball.kicker).score += 1;
			g.getACharacter('players', goal.id).lives -= 1;
			g.deleteACharacter('soccerBalls', ball.id);
			setTimeout(() => this.addABall(), 3000);
		}
	});
// End of the new code
}
```
{% capture code %}
		g.handleCollision('goals', 'soccerBalls', (goal, ball) => {
		if (ball.kicker !== goal.id) {
			g.getACharacter('players', ball.kicker).score += 1;
			g.getACharacter('players', goal.id).lives -= 1;
			g.deleteACharacter('soccerBalls', ball.id);
			setTimeout(() => this.addABall(), 3000);
		}
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}


_7.5_ Finally we need to add a game over check.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.getCharacters('players', (player) => {
		player.sprite.depth = 5;
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		} // Click here and hit enter
// Then add these new lines of code:
	},
	() => {},
	(id, attr, value) => {
		if (id === g.myId() && attr === 'lives' && value <= 0) {
			location.reload();
		}
// End of the new code
	});
```
{% capture code %}
},
	() => {},
	(id, attr, value) => {
		if (id === g.myId() && attr === 'lives' && value <= 0) {
			location.reload();
		}
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should be able to score goals!**
