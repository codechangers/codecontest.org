---
title: Setup Bullets
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 6.  Setup bullets
Now, we need to give our character the ability to fight back against the zombies by using bullets. To create bullets what we can do is actually create another _character_ set and call it `'bullets'` so we'll do the same thing that we did to create the first _character_ set. In our **game.js** file in the `init` _method_ we'll add an [addCharacter](/doc/addCharacter/) _function_ with the name of bullet.
```javascript
// Click on: code > client > src > game.js

init() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.addCharacters('bullets', 0.5);
	// End of the new code.
}
```
{% capture code %}
	g.addCharacters('bullets', 0.5);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then we'll want to add an image for the bullet in the `preload` _method_ in **game.js**: ([Need Help?](/tutorials/images/))
```javascript
// Click on: code > client > src > game.js

preload() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.loadImage('bullets', 'bullet.png');
	// End of the new code.
}
```
{% capture code %}
	g.loadImage('bullets', 'bullet.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
We then add a [getCharacters](/docs/getCharacters/) _function_ for our bullet into our `create` _method_ in **game.js**:
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.getCharacters('bullets');
	// End of the new code.
}
```
{% capture code %}
	g.getCharacters('bullets');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we go into our **room.js** to set up our bullet in the server, to do this we add a [setupCharacters](/docs/setupCharacters/) _function_ into our `onInit` _method_ for our bullet:
```javascript
// Click on: code > server > rooms > room.js

onInit() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.setupCharacters('bullets');
	// End of the new code.
}
```
{% capture code %}
	g.setupCharacters('bullets');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we just need to get the bullets to shoot, to do this we need to add a new action into our actions object in our `onMessage` _method_ in **room.js** so we'll go to the last action we created which was probably `moveDown` and we'll add a comma afterward and then press the return key to start a new line. Here we will add a `click` action where we'll write the code that will make our bullets shoot.
```javascript
// Click on: code > server > rooms > room.js

onMessage() {
	// There is some code up here.
	const actions = {
		// There is a little bit more code here.
		// Don't forget to add a comma at the end.
		// Add this new code here:
		click: () => {
			// **Empty Space**

		},
		// End of the new code.
	};
}
```
{% capture code %}
			click: () => {

		},
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Inside our `click` action the first thing we want to do is define a _variable_ to keep track of the Id of each bullet for when we tell them to move. The way we'll keep track of this is setting our _variable_ equal to the id that the [nextCharacterId](/docs/nextCharacterId/) _function_ gives us for the bullets.
```javascript
			// Add this below the **Empty Space**
			const index = g.nextCharacterId('bullets');
```
{% capture code %}
	const index = g.nextCharacterId('bullets');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
After that, we need to tell the game to create a bullet when we click, so we add a [createACharacter](/docs/createACharacter/) _function_ for creating our bullets, when we do this we can use the player's x and y values to tell the game to create the bullet in the same place that the player is.
```javascript
			// Add this next.
			g.createACharacter('bullets', index, { x: player.x, y: player.y, playerId: player.id });
```
{% capture code %}
	g.createACharacter('bullets', index, { x: player.x, y: player.y, playerId: player.id });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we'll use our _variable_ that keeps track of the bullet Id to define a new _variable_ that actually keeps track of each bullet.
```javascript
			// Then add this.
			let newCharacter = g.getACharacter('bullets', index);
```
{% capture code %}
	let newCharacter = g.getACharacter('bullets', index);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then we need to animate them so they don't stay in the same spot the whole time. So we'll use the [playAnimation](/docs/playAnimation/) _function_ to get them to move, and inside of those we will use the [getXTowards](/docs/getXTowards/) and the [getYTowards](/docs/getYTowards/) _functions_ to tell the bullets to move towards where a player clicked.
```javascript
			// These go next.
			g.playAnimation(newCharacter, 'x',
				g.getXTowards(newCharacter, data.x, data.y) * 500, 2000);  
			g.playAnimation(newCharacter, 'y',
				g.getYTowards(newCharacter, data.x, data.y) * 500, 2000);
```
{% capture code %}
			g.playAnimation(newCharacter, 'x',
			g.getXTowards(newCharacter, data.x, data.y) * 500, 2000);  
			g.playAnimation(newCharacter, 'y',
			g.getYTowards(newCharacter, data.x, data.y) * 500, 2000);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
You can change the first number to change the distance that the bullet will shoot, and the second number to change the speed of the bullet. Now there is only one more line that we need in our `click` action, and it will make our bullets disappear once they reach the end of their range. It's a `setTimeout` _function_ that will use the [deleteACharacter](/docs/deleteACharacter/) _function_ to delete a bullet.
```javascript
			// This is the last step!
			setTimeout(() => g.deleteACharacter('bullets', newCharacter.id), 2000);
```
{% capture code %}
	setTimeout(() => g.deleteACharacter('bullets', newCharacter.id), 2000);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
When you write this function you want to make sure that the number at the end matches the number at the end of your [playAnimation](/docs/playAnimation/) _functions_, in this example they are both 2000. Now your `click` action should look similar to this.
```javascript
// Click on: code > server > rooms > room.js

onMessage() {
	// There is some code up here.
	const actions = {
		// There is a little bit more code here.
		click: () => {
			// This is what we added:
			const index = g.nextCharacterId('bullets');
			g.createACharacter('bullets', index, { x: player.x, y: player.y });
			let newCharacter = g.getACharacter('bullets', index);
			g.playAnimation(newCharacter, 'x',
				g.getXTowards(newCharacter, data.x, data.y) * 500, 2000);  
			g.playAnimation(newCharacter, 'y',
				g.getYTowards(newCharacter, data.x, data.y) * 500, 2000);
			setTimeout(() => g.deleteACharacter('bullets', newCharacter.id), 2000);
			// End of what we added.
		},
	};
}
```
{% capture code %}
			const index = g.nextCharacterId('bullets');
			g.createACharacter('bullets', index, { x: player.x, y: player.y });
			let newCharacter = g.getACharacter('bullets', index);
			g.playAnimation(newCharacter, 'x',
				g.getXTowards(newCharacter, data.x, data.y) * 500, 2000);  
			g.playAnimation(newCharacter, 'y',
				g.getYTowards(newCharacter, data.x, data.y) * 500, 2000);
			setTimeout(() => g.deleteACharacter('bullets', newCharacter.id), 2000);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now there is only two more things we need to do to make our bullets shoot, first check and make sure your **game.js** file has a `click` _method_ that looks like this:
```javascript
// Click on: code > client > src > game.js

click(x, y) {  
	// You might have some other code here.
	// Add this new code below your other code:
	g.sendAction('click', {x, y});
	// End of the new code.
}
```
{% capture code %}
	g.sendAction('click', {x, y});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
And finally, we just need to add a [handleAnimations](/docs/handleAnimations/) _function_ into our `onUpdate` _method_ in the **room.js** file _function_ for our bullets.
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.handleAnimations('bullets');
	// End of the new code.
}
```
{% capture code %}
	g.handleAnimations('bullets');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now our bullets should be shooting when we click, but they aren't killing the zombies yet, so to make that happen we just need to add another [handleCollision](/docs/handleCollision/) _function_ into our `onUpdate` _method_ right under our last one. This time for the bullet and the zombie.
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.handleCollision('bullets', 'zombies', (bullet, zombie) => {
		g.deleteACharacter('zombies', zombie.id);
		g.deleteACharacter('bullets', bullet.id);
	});
	// End of the new code.
}
```
{% capture code %}
	g.handleCollision('bullets', 'zombies', (bullet, zombie) => {
		g.deleteACharacter('zombies', zombie.id);
		g.deleteACharacter('bullets', bullet.id);
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now you should have working bullets that can kill the zombies when you shoot!
