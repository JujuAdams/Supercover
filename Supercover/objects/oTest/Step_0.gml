// Feather disable all

if (mouse_check_button_pressed(mb_right))
{
    x1 = mouse_x / gridSize;
    y1 = mouse_y / gridSize;
}

if (mouse_check_button(mb_left))
{
    x2 = mouse_x / gridSize;
    y2 = mouse_y / gridSize;
}

if (keyboard_check_pressed(ord("R")))
{
    var _angle = random(360);
    var _x =  dcos(_angle);
    var _y = -dsin(_angle);
    ray = new SupercoverIterator(mouse_x / gridSize, mouse_y / gridSize, _x, _y);
}

if (keyboard_check_pressed(vk_space))
{
    ray.Next();
}