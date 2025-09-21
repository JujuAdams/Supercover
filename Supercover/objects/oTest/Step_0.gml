// Feather disable all

if (mouse_check_button_pressed(mb_right))
{
    x1 = x2;
    y1 = y2;
}

if (mouse_check_button(mb_left))
{
    x2 = mouse_x / gridSize;
    y2 = mouse_y / gridSize;
}