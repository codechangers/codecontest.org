---
title: Add HowTo Screen
subtitle: Learn how to make a super cool zombie game
tags: [customize]
author: jason
---

## 9. Add a how to play screen
Now, we are going to make a how to play menu for our game so that anyone who comes on will know how to play our game. To do this we just need to add a _function_ called [useHowToScreen](/docs/useHowToScreen/) in our `create` _method_ in our **game.js** file.

```javascript
// Click on: code > client > src > game.js

create() {
	// You might have some other code here.
	// Add this new code below your other code:
	g.useHowToScreen('How to play', {
		'Move Mouse': 'To aim at the zombies',
		'Click Mouse': 'To shoot at the zombies'
	}, {
		'Blobbert': 'Planning/Coding/Fixing',  // Put your team members names
		'Grunch': 'Coding/Testing/Fixing',     // and what jobs you did, down
		'Nimbo': 'Planning/Designing/Testing', // here in the credits!
		// You can find a list of jobs on your handout!
	});
	// End of the new code.
}
```
{% capture code %}
	g.useHowToScreen('How to play', {
		'Move Mouse': 'To aim at the zombies',
		'Click Mouse': 'To shoot at the zombies'
	}, {
		'Blobbert': 'Planning/Coding/Fixing',  // Put your team members names
		'Grunch': 'Coding/Testing/Fixing',     // and what jobs you did, down
		'Nimbo': 'Planning/Designing/Testing', // here in the credits!
		// You can find a list of jobs on your handout!
	});
{% endcapture %}
{% include code.html copyable=true code=code lang="javascript" file="code/client/src/game.js" %}
When you write yours, you will need to keep adding to your list of controls, and your contributors until you have added everything needed for your game.
