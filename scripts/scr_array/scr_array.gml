/// @function array_swap(_array, _index1, _index2)
/// @description switches the elements in the array with each other.
/// @param _array Array with elements to be swapped.
/// @param _index1 Index of the first element in the array to swap.
/// @param _index2 Index of the second element in the array to swap. 
function array_swap(_array, _index1, _index2)
{
	var _element1 = _array[_index1];
	var _element2 = _array[_index2];
	
	_array[_index1] = _element2;
	_array[_index2] = _element1;
}