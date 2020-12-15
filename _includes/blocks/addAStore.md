  
# Add a store

## 1. Show the store

In order to create a store for your game you will have to put all of the items in the store with the `useStore` _function_ in the **game.js** file in the `create` _method_. In here you will make a list of items that you want in your store that the players can buy.
```javascript
create() {
	g.useStore('Supa Store', [
		new  g.StoreItem(
			'ant.png',
			'Little Ant',
			'Food',
			10,
			'littleAnt'
		),
		new  g.StoreItem(
			'star.png',
			'Star',
			'Points',
			15,
			'star'
		),
	]);
}
```
In each store item you will give the _image name_, _item name_, _money or resource they need to buy it_, _price or how much_, and the _action that will happen if they buy it_.

## 2. Opening and closing the store

Now that we have all of the items we want in our store we will have to open, close, and unlock the store with the `toggleStore` _function_ and the `unlockStore` _function_. Again inside the **game.js** file in the `update` _method_ for this example we are going to toggle it on and off with the tab key.
```javascript
update() {
	if (g.canSend()) {
		const { tab } = g.getKeysDown();
		if (tab) g.toggleStore();
		else  g.unlockStore();
	}
}
```
This will make the store open and close when the tab key is pressed as long as you add the tab key into your keys.

## 3. Adding the item when bought
At this point we can use the action you sent in the `StoreItem` to add the item that you bought to your item bar.
_*if you haven't made an item bar yet refer to setup items_

We will do this in the `onMessage` _method_ in the **room.js** file with the `purchase` _function_.
```javascript
onMessage(client, data) {
	const  actions = {
		littleAnt: () => {
			let  prevItems = player['ants'];	
			g.purchase(player, 'score', 5, 'ants')
			if (!prevItems) {
				player['ants'] = 1;
				g.addItemToCharacter(player, 'ants', 1);
			} else  if (prevItems < player['ants']) {
				player.items.ants.uses += 1;
			} else {
				//Not enough money;
			}
		}
		star: () => g.purchase(player, 'score', 15, 'stars'),
	}
}
```
The `littleAnt` _function_ will now add the ant to their hot bar and give them one more use each time they  buy it. As long as you have already created the item with `createNewItem` _function_.
