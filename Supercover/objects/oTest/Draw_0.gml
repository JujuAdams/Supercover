// Feather disable all

if (not surface_exists(surface))
{
    surface = surface_create(room_width/gridSize, room_height/gridSize);
}

var _array = Supercover(x1, y1, x2, y2);

surface_set_target(surface);
draw_clear(c_black);

ArrayDraw(_array);

draw_set_color(ray.diagonal? c_orange : c_yellow);
draw_point(ray.x, ray.y);
draw_set_color(c_white);

surface_reset_target();

draw_surface_ext(surface, 0, 0, gridSize, gridSize, 0, c_white, 1);

draw_set_color(c_red);
draw_line(gridSize*x1, gridSize*y1, gridSize*x2, gridSize*y2);
draw_line(gridSize*ray.xStart, gridSize*ray.yStart, gridSize*(ray.xStart + 10*ray.dx), gridSize*(ray.yStart + 10*ray.dy));

draw_set_color(c_blue);

var _y = 0;
repeat(room_height / gridSize)
{
    var _x = 0;
    repeat(room_width / gridSize)
    {
        draw_rectangle(gridSize*_x, gridSize*_y, gridSize*(_x+1) - 1, gridSize*(_y+1) - 1, true);
        ++_x;
    }
    
    ++_y;
}

draw_set_color(c_white);