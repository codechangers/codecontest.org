---
title: Adding Kicking
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 6. Kick the ball
_6.1_ The first thing we need to do is set all of our characters as circles.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see these lines of code:
	g.setupCharacters('players');
	g.setupCharacters('goals');
	g.setupCharacters('soccerBalls');
// Then change them to:
	g.setupCharacters('players', 'circle');
	g.setupCharacters('goals', 'circle');
	g.setupCharacters('soccerBalls', 'circle');
```
{% capture code %}
	g.setupCharacters('players', 'circle');
	g.setupCharacters('goals', 'circle');
	g.setupCharacters('soccerBalls', 'circle');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_6.2_ After that we need to do is add some values to our soccerBalls.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
			g.nextCharacterId('soccerBalls'), {
				x: GAME_WIDTH / 2,
				y: GAME_HEIGHT / 2, // Click here and hit enter
			// Then add these new lines of code:
				dx: 0,
				dy: 0,
			// End of the new code
			});
```
{% capture code %}
	dx: 0,
	dy: 0,
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_6.3_ Next we need to make the soccerBalls move based on those values.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
onUpdate(dt) {
// Then add these new lines of code:
	const friction = (dv) => dv > -0.01 && dv < 0.01 ? 0 : dv - dv / 6000;
	g.getAllCharacters('soccerBalls', (ball) => {
		g.move(ball, 'x', ball.dx);
		g.move(ball, 'y', ball.dy);
		const bounceX = (ball.x <= ball.width / 2 ||
			ball.x >= GAME_WIDTH - ball.width / 2) ? -1 : 1;
		const bounceY = (ball.y <= ball.height / 2 ||
			ball.y >= GAME_HEIGHT - ball.height / 2) ? -1 : 1;
		ball.dx = bounceX * friction(ball.dx);
		ball.dy = bounceY * friction(ball.dy);
	});
// End of the new code
}
```
{% capture code %}
		const friction = (dv) => dv > -0.01 && dv < 0.01 ? 0 : dv - dv / 6000;
	g.getAllCharacters('soccerBalls', (ball) => {
		g.move(ball, 'x', ball.dx);
		g.move(ball, 'y', ball.dy);
		const bounceX = (ball.x <= ball.width / 2 ||
			ball.x >= GAME_WIDTH - ball.width / 2) ? -1 : 1;
		const bounceY = (ball.y <= ball.height / 2 ||
			ball.y >= GAME_HEIGHT - ball.height / 2) ? -1 : 1;
		ball.dx = bounceX * friction(ball.dx);
		ball.dy = bounceY * friction(ball.dy);
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_6.4_ After that, we need to set the values when we kick the ball.
```javascript
// In the same file, room.js

// Right after the code we just added:
		ball.dy = friction(ball.dy);
	}); // Click here and hit enter
// Then add these new lines of code:
	g.handleCollision('players', 'soccerBalls', (player, ball) => {
		ball.dx = g.getXTowards(player, ball.x, ball.y);
		ball.dy = g.getYTowards(player, ball.x, ball.y);
	});
// End of the new code
}
```
{% capture code %}
	g.handleCollision('players', 'soccerBalls', (player, ball) => {
		ball.dx = g.getXTowards(player, ball.x, ball.y);
		ball.dy = g.getYTowards(player, ball.x, ball.y);
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should be able to kick the soccer ball!**
