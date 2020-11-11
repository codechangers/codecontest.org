---
title: Characters
subtitle: Cras at dolor eget urna varius faucibus tempus in elit. Cras a dui imperdiet, tempus metus quis, pharetra turpis.
tags: [features]
author: jason
---
## Client Methods

<a href="/docs/gamejscreate/">`addCharacters()`</a> - This function allows you to add a new character to the game.

<a href="/docs/">`getCharacters()`</a> - This function allows you to listen to characters on the server.

<a href="/docs/">`sendCharacterSize()`</a> - This function sends the size of the character to the server.

#### game.js
``` js
init() {
g.addCharacters('players');
...
}
```

``` js
preload() {
...
g.loadImage('players', 'player.png');
}
```

``` js
create() {
...
g.getCharacters('players',
  function() { console.log('Player Joined!'); },
  function() { console.log('Player Left...'); },
  function() { console.log('Player was updated'); }
)
}
```

## Server Methods

<a href="/docs/">`setupCharacters()`</a> - This function sets up a set of characters.

<a href="/docs/">`createACharacter()`</a> - This function creates a character instance.

<a href="/docs/">`getACharacter()`</a> - This function gets a character instance

<a href="/docs/">`deleteACharacter()`</a> - This function deletes a character.

<a href="/docs/">`nextCharacterId()`</a> - This function gets an incremental ID for a character

#### room.js

``` js
onInit() {
g.setupCharacters('players', 'box');
...
}
```

``` js
onJoin(client, data) {
...
g.createACharacter('players', client.sessionId, {
  x: 200,
  y: 200,
  ...data
});
}
```

``` js
onLeave(client) {
g.deleteACharacter(client.sessionId);
}
```
