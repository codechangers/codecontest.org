---
title: Set Up Safe Zones
subtitle: (Step 5/9) Set up safe zones and an end zone.
tags: [customize]
---
## 5. Set up safe zones and end zone

First, we'll go into our `game.js` file and use an `addLocations` _function_ **above** our `addCharacters` function.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
g.setSize(GAME_WIDTH, GAME_HEIGHT);// Click here and hit enter
// Then add this new line of code:
g.addLocations('safeZone');
```
{% capture code %}
g.addLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then, still in the `game.js` file in the `create` function we''ll put a  `getLocations` function **above** our `getCharacters` _functions_.
```javascript
// In repl click on: code > client > src > game.js

// Scroll down until you see this code:
g.useStore('The Store', [
// Add Store Items here!
]);// Click here and hit enter
// Then add this new line of code:
	g.getLocations('safeZone');
```
{% capture code %}
g.getLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Then we will move into our `room.js` file in our `onInit` _function_ and use a `setupLocations` _function_ **above** our `setupCharacters` _functions_
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.setBounds(GAME_WIDTH, GAME_HEIGHT);// Click here and hit enter
// Then add this new line of code:
g.setupLocations('safeZone');
```
{% capture code %}
g.setupLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we are going to use 3 `createLocations` _functions_ right **under** the `setupLocations` _function_ that we just wrote, to create three different locations on the map.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.setupLocations('safeZone');// Click here and hit enter
// Then add this new line of code:
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  1940, width:  670, height:  100  },  '6cdc00', player =>  {
	player.safe =  true;
});
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  1000, width:  670, height:  100  },  '6cdc00', player =>  {
	player.safe =  true;
});
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  0, width:  670, height:  100  },  '6cdc00', player =>  {
g.getAllCharacters('players', player =>  { player.x =  270, player.y =  1990, player.spriteName =  'players'  });
});
```
{% capture code %}
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  1940, width:  670, height:  100  },  '6cdc00', player =>  {
	player.safe =  true;
});
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  1000, width:  670, height:  100  },  '6cdc00', player =>  {
	player.safe =  true;
});
g.createALocation('safeZone', g.nextLocationId('safeZone'),  { x:  -47, y:  0, width:  670, height:  100  },  '6cdc00', player =>  {
g.getAllCharacters('players', player =>  { player.x =  270, player.y =  1990, player.spriteName =  'players'  });
});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now we will go into our `onUpdate` _function_ in the `room.js` file and add a `getAllCharacters` _function_ and a `handleLocations` _function_.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
	else {
		enemy.right = true;
	}
});// Click here and hit enter
// Then add this new line of code:
g.getAllCharacters('players', player =>  { player.safe =  false  })
g.handleLocations('safeZone',  'players');
```
{% capture code %}
g.getAllCharacters('players', player =>  { player.safe =  false  })
g.handleLocations('safeZone',  'players');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Now when we make it to the end our players are sent back to the first, later we’ll set up level’s so that we progress every time we make it to the end.
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  use the safe zones!**
