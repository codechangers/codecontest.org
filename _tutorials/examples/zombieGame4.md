---
title: Add Zombies
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 4.  Add the zombies
Now let's add the Zombies! First, we need to upload a new image to use for the zombies ([Need Help?](/tutorials/images/)), so we go back into our `preload` _function_ in the **game.js** file and add a new image called zombies:
```javascript
// Click on: code > client > src > game.js

preload() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.loadImage('zombies', 'zombie.png');
	// End of the new code.
}
```
{% capture code %}
	g.loadImage('zombies', 'zombie.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then we need to add our zombie _character_ to our **game.js** and **room.js** _files_, to do this we need to go into our `onInit` _method_ in **room.js** and add a [setupCharacters](/docs/setupCharacters/) _function_ to it:
```javascript
// Click on: code > server > rooms > room.js

onInit() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.setupCharacters('zombies');
	// End of the new code.
}
```
{% capture code %}
	g.setupCharacters('zombies');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Next we go to our `init` _method_ in **game.js** and add an [addCharacters](/docs/addCharacters/) _function_:
```javascript
// Click on: code > client > src > game.js

init() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.addCharacters('zombies', 0.5);
	// End of the new code.
}
```
{% capture code %}
	g.addCharacters('zombies', 0.5);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Next we go into our `create` _method_ in **game.js** and add a [getCharacters](/docs/getCharacters/) _function_:
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.getCharacters('zombies');
	// End of the new code.
}
```
{% capture code %}
	g.getCharacters('zombies');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then, since we want the zombies to spawn randomly all over the map, and just keep spawning, we'll have to create a `setInterval` _function_ in our `onInit` _method_ in our **room.js** file, that will spawn our zombies for us:
```javascript
// Click on: code > server > rooms > room.js

onInit() {
	// You might have some other code here.
	// Add this new code below your other code:
	setInterval(() => g.createACharacter('zombies',
		g.nextCharacterId('zombies'), {
			x: Math.floor((Math.random() * 2000) + 1),
			y: Math.floor((Math.random() * 2000) + 1)
		}), 2500);
	// End of the new code.
}
```
{% capture code %}
	setInterval(() => g.createACharacter('zombies',
		g.nextCharacterId('zombies'), {
			x: Math.floor((Math.random() * 2000) + 1),
			y: Math.floor((Math.random() * 2000) + 1)
		}), 2500);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
The number at the end will determine how long to wait until it spawns another zombie, and the two 2000 numbers are the bounds for where the zombies should spawn. Now that the zombies are spawning we want them to follow us. To do this all we need to do is add a [follow](/docs/follow/) _function_ into our `onUpdate` _method_ in **room.js**:
```javascript
// Click on: code > server > rooms > room.js

onUpdate(dt) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.follow('players', 'zombies', 1, 0.1);
	// End of the new code.
}
```
{% capture code %}
	g.follow('players', 'zombies', 1, 0.1);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
You can change the numbers to change the distance the zombies will come to your character, and the speed of the zombies.
