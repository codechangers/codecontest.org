---
title: Add Blocks
subtitle: Learn how to create an awesome online soccer game!
tags: [customize]
author: jason
---

## 8. Block Shop
_8.1_ First we need to upload pictures of our blocks ([Need Help?](/tutorials/images/)).

_8.2_ Then we need to create our store items.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
	g.useStore('Block Shop', [
		// Add Store Items here! // Click here and hit enter
	// Then add these new lines of code:
		new g.StoreItem('block3.png', '3 Block', 'Points', 3, 'buy3'),
		new g.StoreItem('block5.png', '5 Block', 'Points', 4, 'buy5'),
	// End of the new code
	]);
```
{% capture code %}
		new g.StoreItem('block3.png', '3 Block', 'Points', 3, 'buy3'),
		new g.StoreItem('block5.png', '5 Block', 'Points', 4, 'buy5'),
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

_8.3_ Next we need to create the buy actions.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
const actions = {
	moveUp: () => g.move(player, 'y', -speed),
	moveDown: () => g.move(player, 'y', speed),
	moveLeft: () => g.move(player, 'x', -speed),
	moveRight: () => g.move(player, 'x', speed), // Click here and hit enter
// Then add these new lines of code:
	buy3: () => g.purchase(player, 'score', 3, 'block3s', 1),
	buy5: () => g.purchase(player, 'score', 4, 'block5s', 1),
// End of the new code
};
```
{% capture code %}
	buy3: () => g.purchase(player, 'score', 3, 'block3s', 1),
	buy5: () => g.purchase(player, 'score', 4, 'block5s', 1),
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should be able to buy blocks!**
