///@function instance_place_array(_x, _y, _object, _ordered)
///@description Copy of instance_place_list but outputs an array instead.
///@param _x x coordinate to check for collisions at.
///@param _y y coordinate to check for collisions at.
///@param _obj Object asset or object instance or tile map or array of instances to check for.
///@param _ordered True or false if the array should be ordered.
function instance_place_array(_x, _y, _obj, _ordered)
{
	var _list = ds_list_create(); //The list that will be populated.
	var _items = instance_place_list(_x, _y, _obj, _list, _ordered); //Populated the list with items.
	var _array = []; //The array that will be filled.
	
	//Copies the _list to _array.
	for (var _i = 0; _i < _items; _i++) 
	{
		_array[_i] = ds_list_find_value(_list, _i);
	}
	
	ds_list_destroy(_list);
	
	return _array;
}
