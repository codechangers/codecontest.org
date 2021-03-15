---
title: Add a Background
subtitle: (Step 1/9) Learn how to add a background to your game!
tags: [customize]
---

### 1. Upload an Image to the Assets Folder
 First, make sure that you have the image that you want for your background added to your asset folder ([Need Help?](/tutorials/images/)).

### 2. Add `loadImage` into the preload() function
{% capture code %}g.loadImage('background',  'background.png');{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

### 3. Add `drawBackground` function in the `create ` function
{% capture code %}g.drawBackground( 'background',  3,  500,  2000 );{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

### 4. Delete `cameraBounds` method
Then we need to go into the `game.js` file and **delete** the `cameraBounds()` method.
{% capture code %}g.cameraBounds(){% endcapture %}
{% include code.html copyable=false code=code lang="javascript" file="code/client/src/game.js" %}

### 5. Change the game width in the top of the  `room.js` file from 2000 to 600.
{% capture code %}const GAME_WIDTH = 600;{% endcapture %}
{% include code.html copyable=false code=code lang="javascript" file="code/client/src/game.js" %}

#### 6. Change the numbers in our `createACharacter `function in our `onJoin` function in the `room.js` file and add a couple new variables.
{% capture code %}g.createACharacter('players', client.sessionId,  { x:  270, y:  1990, safe:  false, speed:  5, spriteName:  "players"  });{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/server/rooms/room.js" %}

>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  your game board should be set up!**
