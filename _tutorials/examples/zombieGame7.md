---
title: Setup Login Screen
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

##### 1. In `game.js`, delete `g.connect();` and reaplce it with login screen code.

{% capture code %}
	g.useLoginScreen(name => g.connect ({name}), 'Zombies', 'Username', 'Start!');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}

##### 2. In `room.js`, add code to customize the login screen.

{% capture code %}
	g.attachTo('players', client.sessionId, {  
		name: 'nameTag',
		x: -50,
		y: -60,
		type: 'text',
		text: data.name
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/server/rooms/room.js" %}

##### 3. In `room.js`, Delete the existing `createACharacter()` function and reaplce it with a new one!

{% capture code %}
	g.createACharacter('players', client.sessionId, { x: 200, y: 200, score: 0, ...data });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/server/rooms/room.js" %}

> **Download your zip, and [upload it](/tutorials/uploadtoserver/) to [blobbert.io](https://blobbert.io/), and you should have a background!**
