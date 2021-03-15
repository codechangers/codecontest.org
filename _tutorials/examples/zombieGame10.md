---
title: Create a Scoreboard
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 10. Create a scoreboard
Next, we're going to create a scoreboard, so that the players can keep track of how many zombies they have killed, and who has killed the most. To do this we need to go into our `create` _method_ in the **game.js** file and change our [getCharacters](/docs/getCharacters/) _function_ for our players to include the [handleLeaderboard](/docs/handleLeaderboard/) _function_. It will be written in as the second, third and fourth _parameters_, so that the scoreboard is updated when a user joins, when their score is updated, and when a user leaves.
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Delete this old code:
	g.getCharacters('players', (player) => {
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
		}
	});
	// Then add this new code where we deleted the old code:
	g.getCharacters('players',
		(player) => {
			g.handleLeaderboard('players', 'Scoreboard');
			if (player.id === g.myId()) {
				g.cameraFollow(player.sprite);
			}},
		(player) => g.handleLeaderboard('players', 'Scoreboard'),
		(id, attr, value) => {
			if (attr == 'filled' && id == 'filled' &&
				value <= 1 && player.id === g.myId()) {
					location.reload();
				}
			g.handleLeaderboard('players', 'Scoreboard');
		});
	// End of the new code.
	// You might have some other code here.
}
```
{% capture code %}
		g.getCharacters('players',
		(player) => {
			g.handleLeaderboard('players', 'Scoreboard');
			if (player.id === g.myId()) {
				g.cameraFollow(player.sprite);
			}},
		(player) => g.handleLeaderboard('players', 'Scoreboard'),
		(id, attr, value) => {
			if (attr == 'filled' && id == 'filled' &&
				value <= 1 && player.id === g.myId()) {
					location.reload();
				}
			g.handleLeaderboard('players', 'Scoreboard');
		});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now, to get the scoreboard to work we also need to add a couple things in our **room.js** file. First, in our `onUpdate` _method_ in the [handleCollision](/docs/handleCollision/) _method_ for our bullet, and zombie, we need to add a [getACharacter](/docs/getACharacter/) _method_. So we need to go after the [deleteACharacter](/docs/deleteACharacter/) _function_ for the `'bullets'` and hit the return key to create a new line. Then add a [getACharacter](/docs/getACharacter/) _function_ and add one hundred to that _character's_ score on the new line.
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	g.handleCollision('bullets', 'zombies', (bullet, zombie) => {
		g.deleteACharacter('zombies', zombie.id);
		g.deleteACharacter('bullets', bullet.id);
		// Add this new code below your other code:
		g.getACharacter('players', bullet.playerId).score += 100;
		// End of the new code.
	});
	// You might have some other code here.
}
```
{% capture code %}
	g.getACharacter('players', bullet.playerId).score += 100;
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now the scoreboard should be set up and our game is almost finished!
