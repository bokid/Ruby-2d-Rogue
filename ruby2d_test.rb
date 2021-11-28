require 'ruby2d'

set title: "2d Test", width: 680, height: 680


hero = Sprite.new(
    'bunny.png',
    x:100,
    y:100,
    width: 64,
    height: 64,
    clip_width: 32,
    time: 100,

    

    animations: {
        idle: 1,
        side_walk: 2..5,
        down_walk: 7..10,
        up_walk: 12..14
    }
)

 coin = Sprite.new(
    'coin.png',
    x:250,
    y:250,
    width: 32,
    height: 32,
    clip_width: 84,
    time: 100,
    loop: true
)

# wall = Rectangle.new(
#     x: 0,
#     y: 0,
#     width: 680,
#     height: 20,
#     color: 'red'
# )
coin.play

x1 = (hero.x + hero.width)
y1 = (hero.y + hero.height)
    

player_speed = 3




on :key_held do |event|
#on key_held?

    if player_speed == 0 
        hero.play animation: :idle, loop: true
    end

    if event.key == 'up' && hero.y <= 0
        puts "We can't move there!"
        player_speed = 0
    elsif event.key == 'up'
        player_speed = 3
        puts "Ok walkin up!"
        hero.play animation: :up_walk,  loop: true
        hero.y -= player_speed
        y1 -= player_speed
     

    elsif event.key == 'down' && y1 >= Window.height
        player_speed = 0
    elsif event.key == 'down'
        player_speed = 3
        hero.play animation: :down_walk, loop: true
        hero.y += player_speed
        y1 += player_speed
    

    elsif event.key == 'left' && hero.x <= 0
        player_speed = 0
    elsif event.key == 'left'
        player_speed = 3
        hero.play animation: :side_walk, loop: true, flip: :horizontal
        hero.x -= player_speed
        x1 -= player_speed

    elsif event.key == 'right' && x1 >= Window.width
        player_speed = 0
    elsif event.key == 'right'
        player_speed = 3
        hero.play animation: :side_walk, loop: true
        hero.x += player_speed
        x1 += player_speed
    end   
end

on :key_up do |event|
    if event.key == 'left'
        hero.play animation: :idle, loop: true, flip: :horizontal
    else
        hero.play animation: :idle, loop: true
    end
end

# case event.key
#     when 'left' && hero.x > 0
#         hero.play animation: :side_walk, loop: true, flip: :horizontal
#         hero.x -= player_speed
#     when 'right' && x1 < Window.width
#         hero.play animation: :side_walk, loop: true
#         hero.x += player_speed
#     when 'up' && hero.y > 0
#         hero.play animation: :up_walk,  loop: true
#         hero.y -= player_speed
#     when 'down' && hero.y1 < Window.height
#         hero.play animation: :down_walk, loop: true
#         hero.y += player_speed
#     when ''
#         hero.play animation: :idle, loop: true
   
# end
show