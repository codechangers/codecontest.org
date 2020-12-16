# Run Hero

## 1. Follow the build your game tutorial

To start, follow the build your game tutorial video from the tutorials tab on the website. You should now have a movable character, and be able to have multiple players join your server.

If you want to change the size of your character you can do this in the `addCharacters` function by adding another parameter. ie. `addCharacters(players, .5)`, the lower the number the smaller your character will be. .5 would be half size. 2 would be twice as big.

  

## 2. Add the background

Next, we’ll get the background set up and our game boundaries.First, make sure that you have the image that you want for your background added to your assets folder. Next, let’s use the `drawBackground` method to create our game background. To do this we’ll go into our `game.js` file and into our `preload` function and add our background image that we want to use. We do this by writing a `loadImage` function like this, but with your image and the name you want to give it.

```javascript
g.loadImage('grass', 'grass.png');
```

After that we stay in the `game.js` file and write a `drawBackground` function in our `create` function, which will look like this:

```javascript
g.drawBackground( 'ground', 1, 500, 2000 );
```

Again remember to add the name of your image in place of grass, and to change the numbers based on how big you want your game to be.

  

Now let’s make it so our character can’t go out of bounds, to do this we will go into our `room.js` file and set our bounds using the `setBounds`function which will go into our `onInit` function. It should look like this:

```javascript
g.setBounds(2000,2000);
```

Make sure that you write it after your `setup` function or else it will mess with your server. You can change the numbers to make the bounds whatever size you want.

  

## 3. Setup the camera follow function

The next step is to get the camera to follow your character so that it won’t be able to leave the screen. To do this we need to use two new methods, the `myId` function (to get which player we want the camera to follow) and the `cameraFollow` function (to get the camera to start following our player).

  

We add the new function into our `game.js` file in the `create` function, then in our `getCharacters` function as the second parameter. To do this we put a comma after the `‘players’` string and then write our function in. We need an if statement to determine if we’re getting the right player, then when we know we do, we assign the camera to follow that player. It should look like this when it’s finished.

```javascript
g.getCharacters('players', player => {
	if (player.id === g.myId()) {
		g.cameraFollow(player.sprite);
	}
});
```

Make sure that you don’t write a new `getCharacters` function, just change the one you already had for players. We’re also going to get our character to start near the bottom of our board, to do this we just need to change the numbers in our `createACharacter` function in our `onJoin` function in the `room.js` file.

  

g.createACharacter(‘players’, client.sessionId, { x: 270, y: 1980 });

  

## 4. Create enemies

  

To do this we need to create another character set. First, we need to upload a new image to use for the new character set, to do this we will go into the `preload` function in `game.js` and add a new image named after the new character set. Make sure that the image you want to use has been added to your `assets` folder.

```javascript
preload(){
	g.loadImage('enemy', 'enemy.png');
}
```

Now we need to add the Character to the `room.js` and `game.js` files. In the `room.js` file we need to put a `setupCharacters` function in the `onInit` function.

```javascript
onInit(){
	g.setupCharacters('enemy');
}
```

Then, in the `game.js` file we need to put an `addCharacters` function in the `init` function.

```javascript
init(){
	g.addCharacters("enemy")
}
```

And a `getCharacters` function in the create function.

```javascript
create(){
	g.getCharacters("enemy")
}
```

Now you can use the `createACharacter` function in the `room.js` file to create the new character wherever it is needed. In this game we want the enemies to be created in random spots around the map as soon as the game starts. To do this the `createACharacter` will be placed in the `room.js` file in the `onInit` function. Since we want multiple characters created when the game starts, we’re going to put our `createACharacter` function in a for loop. So, we create a variable called `i` then we create a for loop with our function inside.

```javascript
onInit(){
let i;
for (i = 0; i < 15; i++) { g.createACharacter('enemy', g.nextCharacterId('enemy'), { x: Math.floor((Math.random() * 500) + 1), y: Math.floor((Math.random() * 2000) + 1) }) }
}
```
You can change the number `30` to the number of enemies that you’d like to create for your game. You could also change the numbers `500`, and `2000` to change the boundaries for where the enemies will be created.

## 5. Add enemy movement and collision

First we’ll add collision, to do this we’ll go into our `onUpdate` function in our `room.js` file and add a `handleCollision` function. In the callback function we’ll set our character’s x and y values equal to what they were when the game started so our characters will be sent back to the start if we get hit.

```javascript
g.handleCollision('players', 'enemy', (player) => { player.x = 270; player.y = 1980 });
```

Then, we’ll add the enemy movement, we’ll set it up in the `onUpdate` function in our `room.js` file. We’re going to set up a `getAllCharacters` function for the enemies, and then for our callback function we will set up some if else statements for the movement.
```javascript
g.getAllCharacters('enemy', (enemy, i) => {
	if (enemy.x <= 575 && enemy.right == true) {
		g.move(enemy, 'x', .01 * i + .1)
	}
	else if (enemy.x >= 25) {
		enemy.right = false;
		g.move(enemy, 'x', -.01 * i - .1);
	}
	else {
		enemy.right = true;
	}
})
```
  

## 6. Setup Safe zones & end zone.

Before we set up an area we are going to add a new variable into our players object that is called `safe` and we will set the value to be `false`. This is in our room.js file in the `onJoin` function, we are just changing the createACharacter function to look like this.
```javascript
g.createACharacter('players', client.sessionId, { x: 270, y: 1990, safe: false});
```
To set up an area we will need to do almost the same thing we did to set up our characters but we’re going to use Location functions instead. So we first go into our game.js file and use an `addLocations` function above our `addCharacters` functions
```javascript
g.addLocations(‘safeZone’);
```
Then, still in the `game.js` file in the create function we will use a `getLocations` function above our `getCharacters` functions.
```javascript
g.getLocations(‘safeZone’);
```
Then we will move into our `room.js` file in our `onInit` function and use a `setupLocations` function above our `setupCharacters` functions
```javascript
g.setupLocations(‘safeZone’);
```
Now we can use a `createLocations` function right under the `setupLocations` function that we just wrote. In the `createLocations` function we’ll write a callback function for what we want to happen when someone enters the location.
```javascript
g.createALocation('safeZone', g.nextLocationId('safeZone'), { x: -47, y: 1940, width: 670, height: 100 }, '6cdc00', player => {
	player.safe = true;
});
```
  

Now we will go into our `onUpdate` function in the `room.js file` and add a `getAllCharacters` function and a `handleLocations` function. This will make our Location start working and we should be safe while in one of our safe zones.
```javascript
g.getAllCharacters('players', player => { player.safe = false })
g.handleLocations('safeZone', 'players');
```
Now that we have a safe zone set up we can create another one by just writing another `createALocation` function right under our first one. So in `room.js` in the `onInit` function we’ll write the same `creatAlocation` function again, but this time we’ll change the y value to 1000 So that the safe zone will be in the middle.

```javascript
g.createALocation('safeZone', g.nextLocationId('safeZone'), { x: -47, y: 1000, width: 670, height: 100 }, '6cdc00', player => {
	player.safe = true;
});
```
Now to create the end zone we’ll just do the same thing we just did and write another `createALocation` function just under the last one we wrote. This time we’ll change the y value to 0 and the callback function to reset our player back to the first.

  
```javascript
g.createALocation('safeZone', g.nextLocationId('safeZone'), { x: -47, y: 0, width: 670, height: 100 }, '6cdc00', player => {
	g.getAllCharacters('players', player => { player.x = 270, player.y = 1990 });
});
```
Now when we make it to the end our players are sent back to the first, later we’ll set up level’s so that we progress every time we make it to the end.

## 7. Set up the login/How to Play screen & nametags

To do this we will go into our `room.js` file and in the create function we will delete the `g.connect()` function and we’re going to write a `useLoginScreen` function in its place using the `connect` function as our callback.
```javascript
g.useLoginScreen((name) => g.connect({ name }), 'RunHero', 'Username', 'Start!');
```
You can change the text to whatever you’d like your login screen to say on it when someone comes on to your game. Then, underneath the useLoginScreen function that we just wrote, we’re going to write a `useHowToScreen` function.
  
```javascript
g.useHowToScreen("How to play", { w: 'Move Up', a: 'move left', s: 'move down', d: 'move right', downArrow: "move down", upArrow: "move up", leftArrow: 'move left', rightArrow: 'move right' }, { Artwork: "Alex Klein", Functionality: "Alex Klein" })
```
Make sure to change the information to match your game and the members on your team. Now, to set up a nametag we will go into our `room.js` file and add an `attachTo` function under in our `onJoin` function right after our `createACharacter` function.

```javascript
g.attachTo('players', client.sessionId, {
	name: 'nameTag',
	x: -50,
	y: -60,
	type: 'text',
	text: data.name
});
```
You can change where the name tag is created by changing the x and y values.

## 8. Set up scoring.
First we need to add a new Character to the `room.js` and `game.js` files to keep track of our score for us.  To do this we need to go into the `room.js` file and put a `setupCharacters` function in the `onInit` function.
```javascript
onInit(){
	g.setupCharacters("team");
}
```
Then, in the `game.js` file we need to put an `addCharacters` function in the `init` function.
```javascript
init(){
	g.addCharacters("team")
}
```
And a `getCharacters` function in the create function.
```javascript
create(){
	g.getCharacters("Team")
}
```
Then to set up levels we are going to set up a leaderboard that tells us which level we are on. To do this we are going to use the `handleLeaderboard` function in the `game.js` file in our create function. The `handleLeaderboard` function will be passed into the `getCharacters` function for the team character that we just created. as the second, third and fourth parameters, so that the leader board will update when a player joins, when a player's score is updated, and when a player leaves the game.

```javascript
g.getCharacters('team', team  => {
	g.handleLeaderboard('team', 'Scoreboard')},
	(player) => { g.handleLeaderboard('team', 'Scoreboard') },
	(id, attr, value) => {
		g.handleLeaderboard('team', 'Scoreboard')
	})
```
Now to get it working, we just need to go into our `room.js` file in the `onInit` function and use a `createACharacter` function to create our team character. We'll just give it an x and y value of 10000 so it stays out of the way, and then we also need to give it a name of level and a score of one to start with. Make sure you write this function underneath the setupCharacters function for the team character. 
```javascript
g.createACharacter('team', 'team', { x:  10000, y:  10000, name:  'Level', score:  1 });
```
Now the scoreboard should show up, but the score doesn't ever change. To make it change we'll need to make a function that adds to the score. We can do this in the `room.js` file in the `onInit` function in the third `createALocation` function that we wrote. This way every time a character reaches the top the score is raised by one.
```javascript
let  team = g.getACharacter('team', 'team')
team.score += 1
```
## 9. Set up Levels

Now our score goes up but the levels never get any harder. To increase the difficulty we can set up a function that re-creates all the enemies, and creates one extra for each level that we complete. We can do this in the `room.js` file in the `onInit` function in the third `createALocation` function that we wrote. To do this we will use two `getAllCharacters` functions. One to delete the enemies that are already created, and one to create a new enemy set based on which level we are currently on. This way the game will re-create the enemies in a new random spot for each level.
```javascript
g.getAllCharacters('enemy', enemy  => { g.deleteACharacter('enemy', enemy.id) })
for (i = 0; i < team.score + 15; i++) { g.createACharacter('enemy', g.nextCharacterId('enemy'), { x:  Math.floor((Math.random() * 500) + 1), y:  Math.floor((Math.random() * 2000) + 1), right:  true }) }
```
## 10. Set up co-op
First, we need to go into our `room.js` file in the `onJoin` function and change our `createACharacter` function for our players to include a speed variable, and a spriteName variable.  
```javascript
g.createACharacter('players', client.sessionId, { x:  270, y:  1990, safe:  false, speed:  5, spriteName:  "players" });
```
Then we'll stay in `room.js` and go to our `onMessage` function and change the speed variable to equal the player's speed. 
```javascript
const  speed = player.speed;
```
Now, in the `game.js` file in our `preload` function we need to add a new image for when the player dies. First make sure you have the image in your assets folder then you can add it. 
```javascript
g.loadImage('grave', 'Grave.png')
```
Then, we need to change our `handleCollision` function  for players and enemies so that if the player isn't in a safe zone the player's sprite will change to the grave and the speed will equal 0 so that they can't move. We also need to add an if statement that checks wether or not all the players have been hit so that we can reset the game if they have.  This will be in the `onUpdate` function in the `room.js` file. 
```javascript
g.handleCollision('players', 'enemy', (player) => {
	if (player.safe == false) {
		player.spriteName = "grave";
		player.speed = 0;
		let  result = true;
		g.getAllCharacters('players', player  => {
		if (player.speed == 5) {
			result = false;
		}
	})
	if (result == true) {
		g.getACharacter('team', 'team').score = 1;
		g.getAllCharacters('players', player  => { player.x = 270, player.y = 1990, player.spriteName = 'players', player.speed = 5 });
		}
	}
});
```
The next thing we need to do is add a `handleCollision` function for our players so that they will be able to save each other when one is hit. We will put this in a `setTimeout` function so that they won't be invincible when two players are touching. Then, we'll add an if statement to see if the player has been hit, and if they have we will change their speed back to 5 and their spriteName back to `players`. This will be written in our `onUpdate` function in the `room.js` file. 
```javascript
setTimeout(function () { g.handleCollision('players', 'players', (player1) => { if (player1.speed == 0) { player1.speed = 5, player1.spriteName = 'players' } }) }, 500);
```
The last thing we need to do is reset the players if one manages to complete the level. We can do this in the `room.js` file in the `onInit` function in the third `createALocation` function that we wrote. We'll just use a `getAllCharacters` function to get all players and then change all their attribute's back to normal. 
```javascript
g.getAllCharacters('players', player  => { player.x = 270, player.y = 1990, player.spriteName = 'players' });
```
And we should now have a fully functioning game! Feel free to customize it and change or add whatever you like!
