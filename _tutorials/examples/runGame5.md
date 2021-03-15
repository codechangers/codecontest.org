---
title: Set Up Safe Zones
subtitle: (Step 5/9) Set up safe zones and an end zone.
tags: [customize]
---
#### 1. Go into our `game.js` file and use an `addLocations` _function_ **above** our `addCharacters` function.

{% capture code %}
g.addLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 2. In the `game.js` file in the `create` function we''ll put a  `getLocations` function **above** our `getCharacters` _functions_.

{% capture code %}
g.getLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 3. In `room.js` file in our `onInit` _function_ and use a `setupLocations` _function_ **above** our `setupCharacters` _functions_

{% capture code %}
g.setupLocations('safeZone');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 4. Use 3 `createLocations` _functions_ right **under** the `setupLocations` _function_ that we just wrote, to create three different locations on the map.

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

#### 5. Go into our `onUpdate` _function_ in the `room.js` file and add a `getAllCharacters` _function_ and a `handleLocations` _function_.

{% capture code %}
g.getAllCharacters('players', player =>  { player.safe =  false  })
g.handleLocations('safeZone',  'players');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

Now when we make it to the end our players are sent back to the first, later we’ll set up level’s so that we progress every time we make it to the end.

>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  use the safe zones!**
