---
title: Set up Name Tags
subtitle: (Step 6/9) Set up name tags.
tags: [customize]
---
## 6. Set up name tags
To set up a name tag we will go into our `room.js` file and add an `attachTo` _function_  in our onJoin _function_ right after our `createACharacter` _function_.
```javascript
// In repl click on: code > server > rooms > room.js

// Scroll down until you see this code:
g.createACharacter('players', client.sessionId,  { x:  270, y:  1990, safe:  false, speed:  5, spriteName:  "players"  });// Click here and hit enter
// Then add this new line of code:
g.attachTo('players', client.sessionId,  {
	name:  'nameTag',
	x:  -50,
	y:  -60,
	type:  'text',
	text: data.name
});
```
{% capture code %}
g.attachTo('players', client.sessionId,  {
	name:  'nameTag',
	x:  -50,
	y:  -60,
	type:  'text',
	text: data.name
});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
You can change where the name tag is created by changing the x and y values.
>  **Download  your  zip,  and  [upload  it](/tutorials/uploadtoserver/)  to  [blobbert.io](https://blobbert.io/),  and  you  should  be  able  to  use the name tags!**
