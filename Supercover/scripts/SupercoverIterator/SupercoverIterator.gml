// Feather disable all

/// @param x
/// @param y
/// @param dx
/// @param dy

function SupercoverIterator(_x, _y, _dx, _dy) constructor
{
    var _d = 1 / sqrt(_dx*_dx + _dy*_dy);
    _dx *= _d;
    _dy *= _d;
    
    xStart   = _x;
    yStart   = _y;
    dx       = _dx;
    dy       = _dy;
    xPrev    = floor(_x);
    yPrev    = floor(_y);
    x        = floor(_x);
    y        = floor(_y);
    xSign    = sign(dx);
    ySign    = sign(dy);
    diagonal = false;
    
    __xDeltaAbs = abs(dx);
    __yDeltaAbs = abs(dy);
    __xWalk = frac(abs(_x));
    __yWalk = frac(abs(_y));
    
    if (dx < 0)
    {
        __xWalk = 1 - __xWalk;
    }
    
    if (dy < 0)
    {
        __yWalk = 1 - __yWalk;
    }
    
    static Next = function()
    {
        xPrev = x;
        yPrev = y;
        
        if (dx == 0)
        {
            y += ySign;
            diagonal = false;
        }
        else if (dy == 0)
        {
            x += xSign;
            diagonal = false;
        }
        else
        {
            var _tX = (1 - __xWalk) / __xDeltaAbs;
            var _tY = (1 - __yWalk) / __yDeltaAbs;
            
            if (_tX < _tY)
            {
                __xWalk  = 0;
                __yWalk += _tX*__yDeltaAbs;
                
                x += xSign;
                diagonal = false;
            }
            else if (_tY < _tX)
            {
                __xWalk += _tY*__xDeltaAbs;
                __yWalk  = 0;
                
                y += ySign;
                diagonal = false;
            }
            else
            {
                __xWalk = 0;
                __yWalk = 0;
                
                x += xSign;
                y += ySign;
                diagonal = true;
            }
        }
    }
}