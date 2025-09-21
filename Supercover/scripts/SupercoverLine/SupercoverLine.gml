// Feather disable all

/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param [array]

function SupercoverLine(_x1, _y1, _x2, _y2, _array = [])
{
    var _xFrac = frac(_x1);
    var _yFrac = frac(_y1);
    
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
    var _xAbs = _xFrac;
    var _yAbs = _yFrac;
    var _count = _nx + _ny;
    while(_count > 0)
    {
        var _xGrad = (1 - _xAbs) / _nx;
        var _yGrad = (1 - _yAbs) / _ny;
        
        if (_xGrad < _yGrad)
        {
            _yAbs += _ny*_xGrad;
            _xAbs  = 0;
            _x += _xSign;
        }
        else if (_xGrad == _yGrad)
        {
            array_push(_array, _x + _xSign, _y);
            array_push(_array, _x, _y + _ySign);
            
            _xAbs = 0
            _yAbs = 0;
            _x += _xSign;
            _y += _ySign;
            
            --_count;
        }
        else
        {
            _xAbs += _nx*_yGrad;
            _yAbs  = 0;
            _y += _ySign;
        }
        
        array_push(_array, _x, _y);
        --_count;
    }
    
    return _array;
}