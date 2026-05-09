var _array = global.messageLog;
var _string = "";

var _start = min(scroll, array_length(_array));
var _end = min(_start + maxLines, array_length(_array))

for (var _i = _start; _i <_end; _i++) 
{    
	_string = _string + _array[_i] + "\n";
}

draw_set_font(fnt_gothic);
draw_set_halign(fa_left);
draw_text(x, y, _string);