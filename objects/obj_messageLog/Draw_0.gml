var _array = global.messageLog;
var _string = "";

for (var _i = 0; _i < array_length(_array); _i++) 
{    
	_string = _string + _array[_i] + "\n";
}

draw_set_font(fnt_gothic);
draw_set_halign(fa_left);
draw_text(x, y, _string);