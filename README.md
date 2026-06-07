GreenFields (working title) is an open-world run-and-gun sandbox game with a lighthearted irreverent tone. You can get guns and shoot people and cause trouble.

Open source, feel free to copy my code just credit me.

Code is offered as-is, WYSIWYG. If code is not actually referenced by in-game assets it's probably a WIP.

If you want to play the game GreenFields.zip has an exe file with the latest build. Game is not done and not really what I'd call playable but it's there if you want it.

TODO:
* rewrite collision so it uses a ds_map or matrix something to store cooldowns for individual hitboxes (you get bit with a bullet and your hitbox checks if the bullet is in the 'hit' _map before registering a hit and if it's not already in the ds_map it gets added with a cooldown that gets decremented in hitbox_step