if !(myBalloon)
{
	npc_speak(dialogue[dialogueIndex], name);
	dialogueIndex++;
	if (dialogueIndex >= array_length(dialogue))
	{
		dialogueIndex = 0;
	}
}