local _TehFFConfig = {
    -- Default: 0.95    | This sets the minimum percentage of satiety (fullness) pal's should recover to. 0.95 is 95%
    satiety_percentage = 0.95,
    -- Default: true    | This enables the following option and changes the eat speed of pals.  Because this mod forces things to eat more, I recommend keeping this enabled.
    change_eat_speed =  true,
    -- Default: 5.0     | This sets the speed that pal's eat, in seconds. Games default value is 10s.
    eat_speed = 5.0,
    -- Default: false   | This turns on console debug printing. Turned on, it may have a slight performance hit. Use if you are experiencing buggy behavior
    debug = false
}

return _TehFFConfig