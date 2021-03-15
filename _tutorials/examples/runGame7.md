---
title: Set up Scoring
subtitle: (Step 7/9) Set up a scoring system.
tags: [customize]
---
## 7. Set up scoring

First we need to add  to go to the `room.js` file and put a `setupCharacters` _function_ in the `onInit` _function_.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.setupLocations('safeZone');// Click here and hit enter
// Then add this new line of code:
	g.setupCharacters("team");
```
{% capture code %}
g.setupCharacters("team");
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then, in the `game.js` file we need to put an `addCharacters` _function_ in the `init` _function_.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
g.addCharacters("enemy", .5)// Click here and hit enter
// Then add this new line of code:
	g.addCharacters("team")
```
{% capture code %}
g.addCharacters("team")
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
And a `getCharacters` function in the create _function_.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.getCharacters("enemy")// Click here and hit enter
// Then add this new line of code:
	g.getCharacters("team")
```
{% capture code %}
g.getCharacters("team")
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now to get it working, we just need to go into our `room.js` file in the onInit function and use a `createACharacter` _function_ to create our team character.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.setupCharacters("team");// Click here and hit enter
// Then add this new line of code:
g.createACharacter('team',  'team',  { x:  10000, y:  10000, name:  'Level', score:  1  });
```
{% capture code %}
g.createACharacter('team',  'team',  { x:  10000, y:  10000, name:  'Level', score:  1  });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now in the `room.js` file in the `onInit` function in the third `createALocation` function that we wrote, we'll tell the score to up, and the difficulty to increase.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.createALocation('safeZone', g.nextLocationId('safeZone'), { x: -47, y: 0, width: 670, height: 100 }, '6cdc00', player => {// Click here and hit enter
// Then add this new line of code:
let team = g.getACharacter('team',  'team')
team.score +=  1
g.getAllCharacters('enemy', enemy =>  { g.deleteACharacter('enemy', enemy.id)  })
for  (i =  0; i < team.score +  15; i++)  { g.createACharacter('enemy', g.nextCharacterId('enemy'),  { x: Math.floor((Math.random()  *  500)  +  1), y: Math.floor((Math.random()  *  1900)  +  1), right:  true  })  }
```
{% capture code %}
let team = g.getACharacter('team',  'team')
team.score +=  1
g.getAllCharacters('enemy', enemy =>  { g.deleteACharacter('enemy', enemy.id)  })
for  (i =  0; i < team.score +  15; i++)  { g.createACharacter('enemy', g.nextCharacterId('enemy'),  { x: Math.floor((Math.random()  *  500)  +  1), y: Math.floor((Math.random()  *  1900)  +  1), right:  true  })  }
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able to complete levels for score!**
