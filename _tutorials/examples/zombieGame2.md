---
title: Add a Background
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 2. Add the background
Next, we'll get the background and our game boundaries setup. First, make sure that you have the image that you want for your background added to your asset folder **(Click on: code > client > asset)** ([Need Help?](/tutorials/images/)). Next, let's use the [drawBackground](/docs/drawBackground/) _function_ to create our game background. To do this we'll go into our **game.js** file and into our `preload` _method_ and add the background image that we want to use. We do this by writing a [loadImage](/docs/loadImage/) _function_ like this:
> **Note:** Put your own image name here if it isn't called `grass.png`.

```javascript
// Click on: code > client > src > game.js

preload() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.loadImage('grass', 'grass.png');
	// End of the new code.
}
```
{% capture code %}
g.loadImage('grass', 'grass.png');
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
After that we stay in the **game.js** file and write a [drawBackground](/docs/drawBackground/) _function_ in our `create` _method_, which will look like this:
```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.drawBackground('grass', 1, 2000, 2000);
	// End of the new code.
}
```
{% capture code %}
	g.drawBackground('grass', 1, 2000, 2000);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
> Again remember to add the name of your image in place of grass, and to change the numbers based on how big you want your game to be.

Now let's make it so our _character_ can't go out of bounds, to do this we will go into our **room.js** file and set our bounds using the [setBounds](/docs/setBounds/) _function_ which will go into our `onInit` _method_. It should look like this:
```javascript
// Click on: code > server > rooms > room.js

onInit() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.setBounds(2000, 2000);
	// End of the new code.
}
```
{% capture code %}
	g.setBounds(2000, 2000);
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
Make sure that you write it after your `setup` _function_ or else it will break your game. You can change the numbers to make the bounds whatever size you want.
