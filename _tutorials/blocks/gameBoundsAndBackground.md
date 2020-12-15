---
title: Game Bounds & Background
subtitle: Learn how to add boundries and a background to your game.
tags: [customize]
author: jason
---
## 1. Drawing the background
To draw the background the drawBackground method should be used, and the loadImage method should be used. The background image should be added to the assets folder first. Then using a loadImage method, it should be added to the game.js file in the preload function. 
```javascript
preload(){
g.loadImage('grass', 'grass.png');
}
```
After that, still in the game.js file a drawBackground function should be used in the create function, to set the size of the image, and the background for the game.
```javascript
create(){
g.drawBackground( ‘grass’, 1, 2000, 2000 )
}
```
The string, should be the name that you gave to your image. The first number can be changed to scale the size of your image. ie. 0.5 for half size. The last two numbers can be changed to customize the width and height of your background. 

## 2. Setting game boundaries

The first step to setting up the boundaries for the game is to give the server the size of the game. To do this a setBounds method should be used in the onInit function in the room.js file.   
```javascript
onInit(){
g.setBounds(2000,2000);
}
```
Make sure it is written after the setup method. The numbers can be changed to customize the width and height of the game bounds. 

## 3. Getting the camera to follow a character

To get the camera to follow a character the getCharacters function for that character should take in a function as a parameter. The function should use the myId method to find which player the camera should be following. Then, the cameraFollow method to assign the camera to that character. 
  
```javascript
create(){
	g.getCharacters('players', player => {
		if (player.id === g.myId()) {
			g.cameraFollow(player.sprite);
}});
}
```
