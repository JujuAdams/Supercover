// Feather disable all

function ArrayDraw(_array)
{
    var _i = 0;
    repeat(array_length(_array) div 2)
    {
        var _x = _array[_i  ];
        var _y = _array[_i+1];
        draw_point(_x, _y);
        _i += 2;
    }
}