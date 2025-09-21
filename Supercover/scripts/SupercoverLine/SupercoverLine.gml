// Feather disable all

/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param [array]

function SupercoverLine(_x1, _y1, _x2, _y2, _array = [])
{
    var _xDelta = _x2 - _x1;
    var _yDelta = _y2 - _y1;
    var _xDeltaAbs = abs(_xDelta);
    var _yDeltaAbs = abs(_yDelta);
    var _xSign = sign(_xDelta);
    var _ySign = sign(_yDelta);
    
    var _x2Grid = floor(_x2);
    var _y2Grid = floor(_y2);
    
    //We always have the origin cell
    var _xWrite = floor(_x1);
    var _yWrite = floor(_y1);
    array_push(_array, _xWrite, _yWrite);
    
    //Handle degenerate axis-aligned lines
    if (_xWrite == _x2Grid)
    {
        if (_yWrite == _y2Grid) return _array;
        
        repeat(round(_yDeltaAbs))
        {
            _yWrite += _ySign;
            array_push(_array, _xWrite, _yWrite);
        }
        
        return _array;
    }
    else if (_yWrite == _y2Grid)
    {
        repeat(round(_xDeltaAbs))
        {
            _xWrite += _xSign;
            array_push(_array, _xWrite, _yWrite);
        }
        
        return _array;
    }
    
    //Supercover algo
    
    var _xWalk = frac(abs(_x1));
    var _yWalk = frac(abs(_y1));
    
    if (_xDelta < 0)
    {
        _xWalk = 1 - _xWalk;
    }
    
    if (_yDelta < 0)
    {
        _yWalk = 1 - _yWalk;
    }
    
    while((_xWrite != _x2Grid) || (_yWrite != _y2Grid))
    {
        var _tX = (1 - _xWalk) / _xDeltaAbs;
        var _tY = (1 - _yWalk) / _yDeltaAbs;
        
        if (_tX < _tY)
        {
            _yWalk += _tX*_yDeltaAbs;
            _xWalk  = 0;
            _xWrite += _xSign;
        }
        else if (_tY < _tX)
        {
            _xWalk += _tY*_xDeltaAbs;
            _yWalk  = 0;
            _yWrite += _ySign;
        }
        else
        {
            array_push(_array, _xWrite + _xSign, _yWrite);
            array_push(_array, _xWrite, _yWrite + _ySign);
            
            _xWalk = 0;
            _yWalk = 0;
            _xWrite += _xSign;
            _yWrite += _ySign;
        }
        
        array_push(_array, _xWrite, _yWrite);
    }
    
    return _array;
}