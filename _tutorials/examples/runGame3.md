---
title: Create Enemies
subtitle: (Step 3/9) Learn how to add enenies into your game.
tags: [customize]
---

## 3. Create Enemies

First, we need to go into the `preload` _function_ in `game.js` and add a new image named after the new character set.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
preload() {// Click here and hit enter
// Then add this new line of code:
	g.loadImage('enemy',  'enemy.png');
```
{% capture code %}g.loadImage('enemy',  'enemy.png');{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
In the `room.js` file we need to put a `setupCharacters` _function_ in the `onInit` function.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
	g.setupCharacters('players');// Click here and hit enter
	// Then add this new line of code:
	g.setupCharacters('enemy');
```
{% capture code %}g.setupCharacters('enemy');{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then, in the `game.js` file we need to put an `addCharacters` _function_ in the `init` _function_.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
g.addCharacters('players', 0.5);// Click here and hit enter
// Then add this new line of code:
g.addCharacters("enemy", .5)
```
{% capture code %}g.addCharacters("enemy", .5){% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
And a getCharacters function in the create function.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
g.drawBackground( 'background', 3, 500, 2000 );// Click here and hit enter
// Then add this new line of code:
	g.getCharacters("enemy")
```
{% capture code %}g.getCharacters("enemy"){% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Next, in the `room.js` _file_ in the `onInit` _function_. We’re going to put a `createACharacter` function in a for loop.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.setupCharacters('enemy');// Click here and hit enter
// Then add this new line of code:
	let i;
	for  (i =  0; i <  15; i++)  { g.createACharacter('enemy', g.nextCharacterId('enemy'),  { x: Math.floor((Math.random()  *  500)  +  1), y: Math.floor((Math.random()  *  1900)  +  1)  })  }
```
{% capture code %}let i;
	for  (i =  0; i <  15; i++)  { g.createACharacter('enemy', g.nextCharacterId('enemy'),  { x: Math.floor((Math.random()  *  500)  +  1), y: Math.floor((Math.random()  *  1900)  +  1)  })  }{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  see enemies!**
