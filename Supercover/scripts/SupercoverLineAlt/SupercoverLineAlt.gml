// Feather disable all

/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param [array]

function SupercoverLineAlt(_x1, _y1, _x2, _y2, _array = [])
{
    var _x = floor(_x1);
    var _y = floor(_y1);
    
    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _nx = abs(_dx);
    var _ny = abs(_dy);
    var _xSign = sign(_dx);
    var _ySign = sign(_dy);
    
    //We always have the origin cell
    array_push(_array, _x, _y);
    
    //Handle degenerate axis-aligned lines
    if (_dx == 0)
    {
        if (_dy == 0) return _array;
        
        repeat(_ny)
        {
            _y += _ySign;
            array_push(_array, _x, _y);
        }
        
        return _array;
    }
    else if (_dy == 0)
    {
        repeat(_nx)
        {
            _x += _xSign;
            array_push(_array, _x, _y);
        }
        
        return _array;
    }
    
    //Supercover algo
    var _xAbs = 0;
    var _yAbs = 0;
    while((_xAbs < _nx) || (_yAbs < _ny))
    {
        var _xGrad = (_xAbs + 0.5) / _nx;
        var _yGrad = (_yAbs + 0.5) / _ny;
        
        if (_xGrad < _yGrad)
        {
            _x += _xSign;
            ++_xAbs;
            
            array_push(_array, _x, _y);
        }
        else if (_xGrad == _yGrad)
        {
            array_push(_array, _x + _xSign, _y);
            array_push(_array, _x, _y + _ySign);
            
            _x += _xSign;
            _y += _ySign;
            ++_xAbs;
            ++_yAbs;
            
            array_push(_array, _x, _y);
        }
        else
        {
            _y += _ySign;
            ++_yAbs;
            
            array_push(_array, _x, _y);
        }
        
    }
    
    return _array;
}