---
title: Setup Login Screen
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 7.  Setup a login screen
Now we'll set up a login screen for our game so that when people join they can choose a display name for their character. To do this we need to go into our **game.js** file and add a line into our `create` _method_, but first we'll delete the [connect](/docs/connect/) _function_ that is in there so we can move it into our [useLoginScreen](/docs/useLoginScreen/) _function_. Then we add a [useLoginScreen](/docs/useLoginScreen/) _function_ in its place.
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Delete this old code:
	g.connect();
	// Then add this new code where we deleted the old code:
	g.useLoginScreen(name => g.connect ({name}), 'Zombies', 'Username', 'Start!');
	// End of the new code.
	// You might have some other code here.
}
```
{% capture code %}
	g.useLoginScreen(name => g.connect ({name}), 'Zombies', 'Username', 'Start!');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
You can customize your login screen by changing the text in place of zombies, username, and start, to whatever you want. Then, to add the nametags to our characters, we just need to go into our **room.js** file and add an [attachTo](/docs/attachTo/) _function_ into our `onJoin` _method_. This time we will give it a type of text instead of bar.
```javascript
// Click on: code > server > rooms > room.js

onJoin(client, data) {
	// You might have some other code here.
	// Add this new code below your other code:
	g.attachTo('players', client.sessionId, {  
		name: 'nameTag',
		x: -50,
		y: -60,
		type: 'text',
		text: data.name
	});
	// End of the new code.
}
```
{% capture code %}
	g.attachTo('players', client.sessionId, {  
		name: 'nameTag',
		x: -50,
		y: -60,
		type: 'text',
		text: data.name
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
You can change the x and y numbers to change where the name tag shows up on your _character_. Then to add your name to your _character_ we'll just go into our **room.js** file in our `onJoin` _method_ and add another _item_ to our _character object_ called name, and we'll give it the value of `data.name`. Then our [createACharacter](/docs/createACharacter/) _function_ should look more like this:
```javascript
// Click on: code > server > rooms > room.js

onJoin(client, data) {
	// You might have some other code here.
	// Delete this old code:
	g.createACharacter('players', client.sessionId, { x: 200, y: 200 });
	// Then add this new code where we deleted the old code:
	g.createACharacter('players', client.sessionId, { x: 200, y: 200, score: 0, ...data });
	// End of the new code.
	// You might have some other code here.
}
```
{% capture code %}
	g.createACharacter('players', client.sessionId, { x: 200, y: 200, score: 0, ...data });
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
