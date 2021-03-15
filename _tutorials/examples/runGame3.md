---
title: Create Enemies
subtitle: (Step 3/9) Learn how to add enenies into your game.
tags: [customize]
---

#### 1. Go into the `preload` _function_ in `game.js` and add a new image named after the new character set.

{% capture code %}g.loadImage('enemy',  'enemy.png');{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}


#### 2. In the `room.js` file we need to put a `setupCharacters` _function_ in the `onInit` function.

{% capture code %}g.setupCharacters('enemy');{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 3. In the `game.js` file we need to put an `addCharacters` _function_ in the `init` _function_.

{% capture code %}g.addCharacters("enemy", .5){% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 4. Add a getCharacters function in the create function.

{% capture code %}g.getCharacters("enemy"){% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

#### 5. In the `room.js` _file_ in the `onInit` _function_. We’re going to put a `createACharacter` function in a for loop.

{% capture code %}let i;
	for  (i =  0; i <  15; i++)  { g.createACharacter('enemy', g.nextCharacterId('enemy'),  { x: Math.floor((Math.random()  *  500)  +  1), y: Math.floor((Math.random()  *  1900)  +  1)  })  }{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  see enemies!**
