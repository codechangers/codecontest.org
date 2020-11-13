---
title: createALocation()
tags: [customize]
---
Create a location with a defined size which follows a custom set of rules.
## Parameters
**type**: `string` - The type of locations.
​
**id**: `string` - A unique location id.
​
**dims**: `object` - Dimension values x, y, width, and height.
​
**color**: `string` - The color of the location.
​
**rules**: `function` - a function telling what happens when someone is in this location.
## Returns
**Nothing**
## Usage
You can use this function after you have initialized the locations feature on both your client side and your server side. You should use this feature in order to create custom locations, anywhere you want on your game map.
