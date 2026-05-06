///Speaks.

/// @description NPC speech.
if !(instance_exists(myBalloon))
{
	var _text = dialogue[dialogueIndex];
	dialogueIndex++;
	dialogueIndex = dialogueIndex % array_length(dialogue);
	
	myBalloon = npc_speak(_text);
}