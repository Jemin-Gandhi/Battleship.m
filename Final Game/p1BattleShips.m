function [player1Board] = p1BattleShips(r, c, b, battleshipScene, player1Board)
%This Function Places the battleships for Player 1


%Main Sprites Used for the Game
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

ship = 0;
while ship < 1
    if (b == 1 && r <= 8 && c < 11 && sum(player1Board(r:r+2,c)) == 6)
        player1Board(r,c) = top_ship_sprite;
        player1Board(r+1,c) = vert_ship_sprite;
        player1Board(r+2,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c <= 8 && sum(player1Board(r,c:c+2)) == 6)
        player1Board(r,c) = left_ship_sprite;
        player1Board(r,c+1) = horiz_ship_sprite;
        player1Board(r,c+2) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
end

end