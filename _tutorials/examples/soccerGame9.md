---
title: Place Blocks
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 9. Place blocks
_9.1_ First we need to add block characters.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.addCharacters('soccerBalls', 0.2); // Click here and hit enter
// Then add this new line of code:
	g.addCharacters('blocks', 0.5);
}
```
{% capture code %}
	g.addCharacters('blocks', 0.5);
}
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.2_ Then we need to load our block images.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.loadImage('soccerBalls', 'ball.png'); // Click here and hit enter
// Then add these new lines of code:
	g.loadImage('block1', 'block1.png');
	g.loadImage('block2', 'block2.png');
	g.loadImage('block3', 'block3.png');
	g.loadImage('block4', 'block4.png');
	g.loadImage('block5', 'block5.png');
// End of the new code
}
```
{% capture code %}
	g.loadImage('block1', 'block1.png');
	g.loadImage('block2', 'block2.png');
	g.loadImage('block3', 'block3.png');
	g.loadImage('block4', 'block4.png');
	g.loadImage('block5', 'block5.png');
}
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.3_ Next we need to get our blocks.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
	g.getCharacters('soccerBalls'); // Click here and hit enter
// Then add this new line of code:
	g.getCharacters('blocks');
}
```
{% capture code %}
g.getCharacters('blocks');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.4_ We also need to place a block when we click.
```javascript
// In the same file, game.js

// Scroll down until you see this code:
click(x, y) {
// Click on the empty line
// Then add these new lines of code:
	if (g.canSend()) {
		g.sendAction('placeBlock', {x, y});
	}
// End of the new code
}
```
{% capture code %}
if (g.canSend()) {
		g.sendAction('placeBlock', {x, y});
	}
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.5_ Then we need to setup the blocks.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this line of code:
	g.setupCharacters('goals', 'circle');
	g.setupCharacters('soccerBalls', 'circle'); // Click here and hit enter
// Then add this new line of code:
	g.setupCharacters('blocks');
}
```
{% capture code %}
g.setupCharacters('blocks');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.6_ After that we need to add the blocks into the game.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
	buy3: () => g.purchase(player, 'score', 3, 'block3s', 1),
	buy5: () => g.purchase(player, 'score', 4, 'block5s', 1), // Click here and hit enter
// Then add these new lines of code:
	placeBlock: ({ x, y }) => {
		if (player.block5s > 0) {
			g.createACharacter('blocks', g.nextCharacterId('blocks'),
				{x, y, health: 5, spriteName: 'block5'});
		} else if (player.block3s > 0) {
			g.createACharacter('blocks', g.nextCharacterId('blocks'),
				{x, y, health: 3, spriteName: 'block3'});
		}
	},
// End of the new code
};
```
{% capture code %}
	placeBlock: ({ x, y }) => {
		if (player.block5s > 0) {
			g.createACharacter('blocks', g.nextCharacterId('blocks'),
				{x, y, health: 5, spriteName: 'block5'});
		} else if (player.block3s > 0) {
			g.createACharacter('blocks', g.nextCharacterId('blocks'),
				{x, y, health: 3, spriteName: 'block3'});
		}
	},
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_9.7_ Finally we need to have the ball run into the blocks.
```javascript
// In the same file, room.js

// Scroll down until you see this code:
			g.deleteACharacter('soccerBalls', ball.id);
			setTimeout(() => this.addABall(), 3000);
		}
	}); // Click here and hit enter
// Then add these new lines of code:
	g.handleCollision('soccerBalls', 'blocks', (ball, block) => {
		ball.dx = g.getXTowards(block, ball.x, ball.y);
		ball.dy = g.getYTowards(block, ball.x, ball.y);
		const bh = block.health - 1;
		if (bh > 0) {
			block.health = bh;
			block.spriteName = `block${bh}`;
		} else {
			g.deleteACharacter('blocks', block.id);
		}
	});
// End of the new code
}
```
{% capture code %}
	g.handleCollision('soccerBalls', 'blocks', (ball, block) => {
		ball.dx = g.getXTowards(block, ball.x, ball.y);
		ball.dy = g.getYTowards(block, ball.x, ball.y);
		const bh = block.health - 1;
		if (bh > 0) {
			block.health = bh;
			block.spriteName = `block${bh}`;
		} else {
			g.deleteACharacter('blocks', block.id);
		}
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should be able to place down blocks!**
