---
title: Add a Health Bar
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 5. Add a health bar
 Next, we'll add a health bar, so that if the zombies hit us, we'll lose health. The first thing we need to do is go into our `onJoin` _method_ in the **room.js** file and add an [attachTo](/docs/attachTo/) _function_:
```javascript
// Click on: code > server > rooms > room.js

onJoin(client, data) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.attachTo('players', client.sessionId, {  
		name: 'healthBar',
		x: -50,
		y: 40,
		width: 100,
		height: 10,
		type: 'bar',
		filled: 100
	});
	// End of the new code.
}
```
{% capture code %}
	g.attachTo('players', client.sessionId, {  
		name: 'healthBar',
		x: -50,
		y: 40,
		width: 100,
		height: 10,
		type: 'bar',
		filled: 100
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we have a health bar but we don't lose health when we are hit, to fix this we need to add a [handleCollision](/docs/handleCollision/) _function_ into our `onUpdate` _method_ in **room.js**:
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.handleCollision('players', 'zombies', (player) => {
		if (player.healthBar.filled > 0) {
			player.healthBar.filled -= 0.1;
		}
	});
	// End of the new code.
}
```
{% capture code %}
	g.handleCollision('players', 'zombies', (player) => {
		if (player.healthBar.filled > 0) {
			player.healthBar.filled -= 0.1;
		}
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Once we do that, we will be able to be hit by the zombies and have our health go down.
