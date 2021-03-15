---
title: Enemies Movement
subtitle: (Step 4/9) Learn how to make enemies move and recognize collision.
tags: [customize]
---
## 4.  Add enemy movement and collision
To do this we’ll go into our `onUpdate` _function_ in our `room.js` file and add a `handleCollision` _function_ that sends our characters back to the start.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
onUpdate(dt) {// Click here and hit enter
// Then add this new line of code:
g.handleCollision('players',  'enemy',  (player)  =>  {
	if (player.safe === false) {
		player.x =  270;
		player.y =  1980;
	}
});
```
{% capture code %}g.handleCollision('players',  'enemy',  (player)  =>  {
	if (player.safe === false) {
		player.x =  270;
		player.y =  1980;
	}
});{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then,  in the `onUpdate` function in our `room.js` file we put a `getAllCharacters`  _function_. (for our callback function we will set up some if else statements for the movement.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
if (player.safe === false) {
		player.x =  270;
		player.y =  1980;
	}
});// Click here and hit enter
// Then add this new line of code:
g.getAllCharacters('enemy', (enemy, i) => {
	if (enemy.x <= 575 && enemy.right == true) {
		g.move(enemy, 'x', .01 * i + .1);
	}
	else if (enemy.x >= 25) {
		enemy.right = false;
		g.move(enemy, 'x', -.01 * i - .1);
	}
	else {
		enemy.right = true;
	}
});
```
{% capture code %}
g.getAllCharacters('enemy', (enemy, i) => {
	if (enemy.x <= 575 && enemy.right == true) {
		g.move(enemy, 'x', .01 * i + .1);
	}
	else if (enemy.x >= 25) {
		enemy.right = false;
		g.move(enemy, 'x', -.01 * i - .1);
	}
	else {
		enemy.right = true;
	}
});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  interact with enemies!**
