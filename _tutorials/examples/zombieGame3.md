---
title: Setup Camera Follow
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 3. Setup the camera follow function
> **Hint:** Click on a _function_ name, to get more information on how to customize it!

The next step is to get the camera to follow your _character_ so that it won't be able to leave the screen. To do this we need to use two new _methods_, the [myId](/docs/myId/) _function_ (to get which player we want the camera to follow) and the [cameraFollow](/docs/cameraFollow/) _function_ (to get the camera to start following our player).

We add the new _function_ into our **game.js** file in the `create` _method_, then in our [getCharacters](/docs/getCharacters/) _function_ as the second _parameter_. To do this we put a comma after the `'players'` _string_ and then write our _function_ in. We need an _if statement_ to determine if we're getting the right player, then when we know we do, we assign the camera to follow that player. It should look like this when it's finished:
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.getCharacters('players', (player) => {
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	});
	// End of the new code.
}
```
{% capture code %}
		g.getCharacters('players', (player) => {
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Make sure that you **don't** write a new [getCharacters](/docs/getCharacters/) _function_, just change the one you already had for `'players'`.
