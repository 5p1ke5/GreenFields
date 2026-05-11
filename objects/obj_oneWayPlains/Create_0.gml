/// @desc Creates a one-way platform.
var _platform = instance_create_depth(x, y, depth, ONEWAY);

var _xScale = image_xscale;
with (_platform)
{
	image_xscale = _xScale;
}