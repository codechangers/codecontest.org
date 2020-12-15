# Zombies

## 1. Follow the build your game tutorial
To start, follow the game setup tutorial video from the tutorials tab on the website. You should now have a movable character, and be able to have multiple players join your server.
    
If you want to change the size of your character you can do this in the `addCharacters` function by adding another parameter. ie. `addCharacters(players, .5)`, the lower the number the smaller your character will be. .5 would be half size. 2 would be twice as big.
## 2.  Setup the camera follow function
The next step is to get the camera to follow your character so that it won’t be able to leave the screen. To do this we need to use two new methods, the `myId` function (to get which player we want the camera to follow) and the `cameraFollow` function (to get the camera to start following our player).

We add the new function into our `game.js` file in the `create` function, then in our `getCharacters` function as the second parameter. To do this we put a comma after the `‘players’` string and then write our function in. We need an if statement to determine if we’re getting the right player, then when we know we do, we assign the camera to follow that player. It should look like this when it’s finished.
```javascript
g.getCharacters('players', player => {  
	if (player.id === g.myId()) {  
		g.cameraFollow(player.sprite);  
	}  
});
```
Make sure that you don’t write a new `getCharacters` function, just change the one you already had for players. Don’t worry if it looks like your character isn’t moving now, we’ll fix that in the next step.
## 3.  Add the background
Next, we’ll get the background set up and our game boundaries.First, make sure that you have the image that you want for your background added to your assets folder. Next, let’s use the `drawBackground` method to create our game background. To do this we’ll go into our `game.js` file and into our `preload` function and add our background image that we want to use. We do this by writing a `loadImage` function like this, but with your image and the name you want to give it.
```javascript
g.loadImage('grass', 'grass.png');
```
After that we stay in the `game.js` file and write a `drawBackground` function in our `create` function, which will look like this:
```javascript
g.drawBackground( 'grass', 1, 2000, 2000 );
```
Again remember to add the name of your image in place of grass, and to change the numbers based on how big you want your game to be.

Now let’s make it so our character can’t go out of bounds, to do this we will go into our `room.js` file and set our bounds using the `setBounds`function which will go into our `onInit` function. It should look like this:
```javascript
g.setBounds(2000,2000);
```
Make sure that you write it after your `setup` function or else it will mess with your server. You can change the numbers to make the bounds whatever size you want.
## 4.  Add the zombies
Now let’s add the Zombies! First, we need to upload a new image to use for the zombies, so we go back into our `preload` function in the `game.js`  file and add a new image called zombies:
```javascript
g.loadImage('zombie', 'zombie.png');
```
Then we need to add our zombie character to our `game.js` and `room.js` files, to do this we need to go into our `onInit` function in `room.js` and add a `setupCharacters` function to it:
```javascript
g.setupCharacters('zombie');
```
Next we go to our `init` function in `game.js` and add an `addCharacters` function:
```javascript
g.addCharacters('zombie', .5);
```
Next we go into our create function in `game.js` and add a `getCharacters` function:
```javascript
g.getCharacters('zombie')
```
Then, since we want the zombies to spawn randomly all over the map, and just keep spawning, we’ll have to create a `setInterval` function in our `onInit` function in our `room.js` file, that will spawn our zombies for us:
```javascript
setInterval(function () { g.createACharacter('zombie', g.nextCharacterId('zombie'), { x: Math.floor((Math.random() * 2000) + 1), y: Math.floor((Math.random() * 2000) + 1) }) }, 2500)
```
The number at the end will determine how long to wait until it spawns another zombie, and the two 2000 numbers are the bounds for where the zombies should spawn. Now that the zombies are spawning we want them to follow us. To do this all we need to do is add a `follow` function into our `onUpdate` function in `room.js`:
```javascript
g.follow('players', 'zombie', 1, .1)
```
You can change the number to change the distance the zombies will come to your character, and the speed of the zombies.

## 5.  Add a health bar
 Next, we’ll add a health bar, so that if the zombies hit us, we’ll lose health. The first thing we need to do is go into our `onJoin` function in the `room.js` file and add an `attachTo` function:
```javascript
g.attachTo('players', client.sessionId,{  
	name: 'healthBar',  
	x: -50,  
	y: 40,  
	width: 100,  
	height: 10,  
	type: 'bar',  
	filled: 100  
});
```
Now we have a health bar but we don’t lose health when we are hit, to fix this we need to add a `handleCollision` function into our `onUpdate` function in `room.js`:
```javascript
g.handleCollision('players', 'zombie', player => player.healthBar.filled > 0 ? player.healthBar.filled -= .1 : null);
```
Once we do that, we will be able to be hit by the zombies and have our health go down.
## 6.  Setup bullets
Now, we need to give our character the ability to fight back against the zombies. To create bullets what we can do is actually create another character and call it “bullet” so we’ll do the same thing that we did to create the first character. In our `game.js` file in the `init` function we’ll add an `addCharacter` function with the name of bullet.
```javascript
g.addCharacter("bullet", .5);
```
Then we’ll want to add an image for the bullet in the `preload` function in `game.js`
```javascript
g.loadImage("bullet", 'bullet.png');
```
We then add a `getCharacters` function for our bullet into our `create` function in `game.js`
```javascript
g.getCharacters('bullet')
```
Now we go into our `room.js` to set up our bullet in the server, to do this we add a `setupCharacters` function into our `onInit` function for our bullet
```javascript
g.setupCharacters('bullet')
```
Now we just need to get the bullets to shoot, to do this we need to add a new action into our actions object in our `onMessage` function in `room.js` so we’ll go to the last action we created which was probably `moveDown` and we’ll add a comma afterward and then return to start a new line. Here we will add a `click` function where we’ll write the code that will make our bullets shoot.
```javascript
Click: () => {  
  
}
```
Inside our `click` function the first thing we want to do is define a variable to keep track of the Id of each bullet for when we tell them to move. The way we’ll keep track of this is setting our variable equal to the id that the `nextCharacterId` function gives us for the bullets.
```javascript
const index = g.nextCharacterId('bullet');
```
After that, we need to tell the game to create a bullet when we click, so we add a `createACharacter` function for creating our bullets, when we do this we can use the player’s x and y values to tell the game to create the bullet in the same place that the player is.
```javascript
g.createACharacter('bullet', index, {x: player.x, y: player.y});
```
Now we’ll use our variable that keeps track of the bullet Id to define a new variable that actually keeps track of each bullet
```javascript
let newCharacter = g.getACharacter('bullet', index)
```
Then we need to animate them so they don’t stay in the same spot the whole time. So we’ll use the playAnimation function to get them to move, and inside of those we will use the getXTowards and the getYTowards functions to tell the bullets to move towards where a player clicked.
```javascript
g.playAnimation(newCharacter, 'x', g.getXTowards(newCharacter, data.x, data.y)* 500, 2000);  
g.playAnimation(newCharacter, 'y', g.getYTowards(newCharacter, data.x, data.y)* 500, 2000);
```
You can change the first number to change the distance that the bullet will shoot, and the second number to change the speed of the bullet. Now there is only one more line that we need in our click function, and it will make our bullets disappear once they reach the end of their range. It’s a `setTimeout` function that will use the `deleteACharacter` function to delete a bullet.
```javascript
setTimeout(function (){ g.deleteACharacter('bullet', newCharacter.id); }, 2000)
```
When you write this function you want to make sure that the number at the end matches the number at the end of your `playAnimation` functions, in this example they are both 2000. Now your `click` function should look similar to this
```javascript
Click: () => {  
const index = g.nextCharacterId('bullet');  
g.createACharacter('bullet, index, {x: player.x, y: player.y});  
Let newCharacter = g.getACharacter('bullet', index)  
g.playAnimation(newCharacter, 'x', g.getXTowards(newCharacter, data.x, data.y)* 500, 2000);  
g.playAnimation(newCharacter, 'y', g.getYTowards(newCharacter, data.x, data.y)* 500, 2000);  
setTimeout(function (){ g.deleteACharacter('bullet', newCharacter.id); }, 2000)  
}
```
Now there is only two more things we need to do to make our bullets shoot, first check and make sure your `game.js` file has a `click` function that looks like this
```javascript
click(x,y){  
	g.sendAction('click', {x,y})  
}
```
And finally, we just need to add a `handleAnimations` function into our `onUpdate` in the `room.js` file function for our bullets
```javascript
g.handleAnimations('bullet');
```
Now our bullets should be shooting when we click, but they aren’t killing the zombies yet, so to make that happen we just need to add another `handleCollision` function into our `onUpdate`function right under our last one. This time for the bullet and the zombie.
```javascript
g.handleCollision('bullet', 'zombie', (bullet, zombie) => {  
g.deleteACharacter("zombie", zombie.id); g.deleteACharacter("bullet", bullet.id) })
```
Now you should have working bullets that can kill the zombies when you shoot!
## 7.  Setup a login screen
Now we’ll set up a login screen for our game so that when people join they can choose a display name for their character. To do this we need to go into our `game.js` file and add a line into our `create` function, but first we’ll delete the `g.connect` function that is in there so we can move it into our `useLoginScreen` function. Then we add a `useLoginScreen` function in its place.
```javascript
g.useLoginScreen(name => g.connect ({name}), 'Zombies', 'Username', 'Start!');
```
You can customize your login screen by changing the text in place of zombies, username, and start, to whatever you want. Then, to add the nametags to our characters, we just need to go into our `room.js` folder and add an `attachTo` function into our `onJoin` function. This time we will give it a type of text instead of bar.
```javascript
g.attachTo('players', client.sessionId, {  
	Name: 'nameTag',  
	x: -50,  
	y: -60,  
	type: 'text',  
	text: data.name  
});
```
You can change the x and y numbers to change where the name tag shows up on your character. Then to add your name to your character we’ll just go into our `room.js` file in our `onJoin` function and add another item to our character object called name, and we’ll give it the value of `data.name`. Then our `createACharacter` function should look more like this:
```javascript
g.createACharacter('players', client.sessionId, { x: 200, y: 200, name: data.name});
```
## 8. Set the player's rotation
  Our next step is to get our character to rotate so that it will always face towards our mouse. To start we will add a function into our `game.js` under our click function called `mousemove`, we will set it up so that it looks the same as our `click` function.
```javascript
mousemove(x,y){  
	g.sendAction('mousemove', { x , y})  
}
```
Now, we can create a `mousemove` function in `room.js`, we’ll put it in the `onMessage` function right under our `click` function. So just like when we added our `click` function we need to add a comma after the last function that was written, which is probably the `click` function. So we write a comma and then return to start a new line where we write our `mousemove` function.
```javascript
mousemove: () =>{ }
```
Inside of the brackets in our `mousemove` function we need to change the rotation of our player, and to get the rotation we need in order to follow the mouse, we will use a function called `getRotationTowards`. Then our `mousemove` function will look like this.
```javascript
mousemove: () => {  
	player.rotation = g.getRotationTowards(player, data.x, data.y);  
}
```
Now our player will always be facing towards the direction of our mouse.

## 9.  Add a how to play screen
Now, we are going to make a how to play menu for our game so that anyone who comes on will know how to play our game. To do this we just need to add a function called `HowToScreen` in our `create` function in our `game.js` file.
    
```javascript
g.useHowToScreen("How to play", { w: "move up", a: "move left"}, {Artwork: "Alex Klein", Functionality: "Alex Klein"})
```
When you write yours, you will need to keep adding to your list of controls, and your contributors until you have added everything needed for your game.

## 10.  Create a scoreboard
Next, we’re going to create a scoreboard, so that the players can keep track of how many zombies they have killed, and who has killed the most. To do this we need to go into our `create` function in the `game.js` file and change our `getCharacters` function for our players to include the `handleLeaderboard` function. It will be written in as the second, third and fourth parameters, so that the scoreboard is updated when a user joins, when their score is updated, and when a user leaves.
```javascript
g.getCharacters('players', (player, data) => {  
	g.handleLeaderboard('players', 'Scoreboard')  
	if (player.id === g.myId()) {  
		g.cameraFollow(player.sprite);  
	}},  
	(player) => { g.handleLeaderboard('players', 'Scoreboard') 
	},  
	(id, attr, value) => {  
		if (attr == 'filled' && id == 'filled' && value <= 1 && player.id === g.myId()) {  
			location.reload()  
		}  
	g.handleLeaderboard('players', 'Scoreboard')  
});
```
Now, to get the scoreboard to work we also need to add a couple things in our `room.js` file. First, in our `onUpdate` function in the `handleCollision` function for our bullet, and zombie, we need to add a `getACharacter` function. So we need to add a semicolon after our second `deleteCharacter function`, then add a `getACharacter` function and add one to that character’s score.
```javascript
...bullet.id); g.getACharacter('players', bullet.playerId).score += 100 })
```
Then, still in the `room.js` file in our `onJoin` function we will add another item into our character called score with a value of 0.
```javascript
g.createACharacter('players', client.sessionId, { x: 200, y: 200, score: 0, name: data.name});
```
Now the scoreboard should be set up and our game is almost finished!

## 11.  Set the Zombies' rotation
The last thing that we are going to do in this tutorial is get the zombies to face towards our character. All that we have to do for this is to change our `follow` function in our `room.js` file under the `onUpdate` function to include a `getRotationTowards` function, telling our zombies which way to turn. The new function should look like this:
```javascript
g.follow('players', 'zombie', 1, .1, (player, zombie) => { zombie.rotation = g.getRotationTowards(zombie, player.x, player.y) })
```
And we should now have a fully functioning game! Feel free to customize it and change or add whatever you like!
