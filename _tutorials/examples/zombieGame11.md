---
title: Set Zombies Rotation
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 11.  Set the Zombies' rotation
The last thing that we are going to do in this tutorial is get the zombies to face towards our _character_. All that we have to do for this is to change our [follow](/docs/follow/) _function_ in our **room.js** file under the `onUpdate` _method_ to include a [getRotationTowards](/docs/getRotationTowards/) _function_, telling our zombies which way to turn. The new _function_ should look like this:
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	// Delete this old code:
	g.follow('players', 'zombies', 1, 0.1);
	// Then add this new code where we deleted the old code:
	g.follow('players', 'zombies', 1, 0.1,
		(player, zombie) => {
			zombie.rotation = g.getRotationTowards(zombie, player.x, player.y);
		});
	// End of the new code.
	// You might have some other code here.
}
```
{% capture code %}
	g.follow('players', 'zombies', 1, 0.1,
		(player, zombie) => {
			zombie.rotation = g.getRotationTowards(zombie, player.x, player.y);
		});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
And we should now have a fully functioning game! Feel free to customize it and change or add whatever you like!
