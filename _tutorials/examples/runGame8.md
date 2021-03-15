---
title: Set up Co-op play
subtitle: (Step 8/9) Set up multiplayer gameplay
tags: [customize]
---
## 8.  Set up Co-op gameplay

First, in the `room.js` file, we'll change the speed in our `onMessage` _function_
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
const speed = 10;// Click here and hit enter
// Then add this new line of code:
const speed = player.speed;
```
{% capture code %}
const speed = player.speed;
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now, in the `game.js` file in our `preload` _function_ we add a new image. First make sure you have the image in your asset folder ([Need Help?](/tutorials/images/)).
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
preload() {// Click here and hit enter
// Then add this new line of code:
g.loadImage('grave',  'Grave.png')
```
{% capture code %}
g.loadImage('grave',  'Grave.png')
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then, we need to **change** our `handleCollision` _function_ for players and enemies in the `onUpdate` _function_ in the `room.js` file.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.handleCollision('players',  'enemy',  (player)  =>  {
	if (player.safe === false) {
		player.x =  270;
		player.y =  1980;
	}
});
//Change it to this code:
g.handleCollision('players',  'enemy',  (player)  =>  {
	if  (player.safe ==  false)  {
		player.spriteName =  "grave";
		player.speed =  0;
		let result =  true;
		g.getAllCharacters('players', player =>  {
		if  (player.speed ==  5)  {
			result =  false;
		}
	})
	if  (result ==  true)  {
		g.getACharacter('team',  'team').score =  1;
		g.getAllCharacters('players', player =>  { player.x =  270, player.y =  1990, player.spriteName =  'players', player.speed =  5  });
	}
	}
});
```
{% capture code %}
g.handleCollision('players',  'enemy',  (player)  =>  {
	if  (player.safe ==  false)  {
		player.spriteName =  "grave";
		player.speed =  0;
		let result =  true;
		g.getAllCharacters('players', player =>  {
		if  (player.speed ==  5)  {
			result =  false;
		}
	})
	if  (result ==  true)  {
		g.getACharacter('team',  'team').score =  1;
		g.getAllCharacters('players', player =>  { player.x =  270, player.y =  1990, player.spriteName =  'players', player.speed =  5  });
	}
	}
});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then we'll add a `handleCollision` _function_ for our players. We will put this in a `setTimeout` _function_. This will be written in our `onUpdate` _function_ in the `room.js` file.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
		g.getAllCharacters('players', player =>  { player.x =  270, player.y =  1990, player.spriteName =  'players', player.speed =  5  });
	}
	}
});// Click here and hit enter
// Then add this new line of code:
setTimeout(function  ()  { g.handleCollision('players',  'players',  (player1)  =>  {  if  (player1.speed ==  0)  { player1.speed =  5, player1.spriteName =  'players'  }  })  },  500);
```
{% capture code %}
setTimeout(function  ()  { g.handleCollision('players',  'players',  (player1)  =>  {  if  (player1.speed ==  0)  { player1.speed =  5, player1.spriteName =  'players'  }  })  },  500);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
And we should now have a fully functioning game! Feel free to customize it and change or add whatever you like!
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able to save your friends if they get hit!**

# *Bonus
If you want to change your character image with each level you complete you can do this last step.

The first thing we will need to do is add 20 images into our `preload` _function_ and name them accordingly:
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
preload(){

g.loadImage('player1', 'player1.png');
g.loadImage('player2', 'player2.png');
g.loadImage('player3', 'player3.png');
g.loadImage('player4', 'player4.png');
g.loadImage('player5', 'player5.png');
g.loadImage('player6', 'player6.png');
g.loadImage('player7', 'player7.png');
g.loadImage('player8', 'player8.png');
g.loadImage('player9', 'player9.png');
g.loadImage('player10', 'player10.png');
g.loadImage('player11', 'player11.png');
g.loadImage('player12', 'player12.png');
g.loadImage('player13', 'player13.png');
g.loadImage('player14', 'player14.png');
g.loadImage('player15', 'player15.png');
g.loadImage('player16', 'player16.png');
g.loadImage('player17', 'player17.png');
g.loadImage('player18', 'player18.png');
g.loadImage('player19', 'player19.png');
g.loadImage('player20', 'player20.png');
```
Then, we will go into our `room.js` file into our `onUpdate` _function_ and change our `setTimeout` _function_ to look like this
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
setTimeout(function () { g.handleCollision('players', 'players', (player1) => { if (player1.speed == 0) { player1.speed = 5; player1.spriteName = `players` } }) }, 500);
//change it to this
g.handleCollision('players', 'players', (player1) => { if (player1.speed == 0) { player1.speed = 5; player1.spriteName = `player${g.getACharacter('team', 'team').score}` } }) }, 500);
```
Then we'll change the `getAllCharacters` _function_ that's inside of the if statement in our `onUpdate` _function_.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.getAllCharacters('players', player  => { player.x = 270; player.y = 1990; player.spriteName = `players`; player.speed = 5 });
//change it to this
g.getAllCharacters('players', player  => { player.x = 270; player.y = 1990; player.spriteName = `player${g.getACharacter('team', 'team').score}`; player.speed = 5 });
```
Then we'll change the `createACharacter` _function_ in our `onJoin` _function_ to look like this:
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.createACharacter('players', client.sessionId, { width:  75, height:  75, x:  270, y:  1990, safe:  false, speed:  5, spriteName:  `players` });
// change it to this
g.createACharacter('players', client.sessionId, { width:  75, height:  75, x:  270, y:  1990, safe:  false, speed:  5, spriteName:  `player${g.getACharacter('team', 'team').score}` });
```
Then we'll change the first `getAllCharacters` in our `createALocation` _function_ in the `onInit` _function_ to look like this:
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.getAllCharacters('players', player  => { player.x = 270; player.y = 1990; player.spriteName = `players` });
//change it to this
g.getAllCharacters('players', player  => { player.x = 270; player.y = 1990; player.spriteName = `player${team.score}` });
```
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  change your character's image every level!**
