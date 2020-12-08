# Create a new Character set

## 1. Uploading an image
First, we need to upload a new image to use for the new character set, to do this we will go into the preload function in game.js and add a new image named after the new character set.
```javascript
preload(){
g.loadImage('zombie', 'zombie.png');
}
```
## 2. Adding the Character
Now we need to add the Character to the room.js and game.js files. In the room.js file we need to put a setpCharacters function in the onInit function.
```javascript
onInit(){
g.setupCharacters('zombie');
}
```
Then, in the game.js file we need to put an addCharacters function in the init function. 
```javascript
init(){
g.addCharacters("zombie")
}
```
And a getCharacters function in the create function.
```javascript
create(){
g.getCharacters("zombie")
}
```

## 3. Creating the Character
Now you can use the createACharacter function in room.js file to create the new character wherever it is needed. In this example the new character will be created near the top left of the screen and will be created as soon as the game starts. To do this the createACharacter will be placed in the room.js file in the onInit function. 
```javascript
onInit(){
g.createACharacter('zombie',g.nextCharacterId('zombie'),{x:20, y:20})
}
```
The x and y values can be changed to position the Character anywhere in the game. 
