
warning('off','all'); 
Locations = Setup();
battleshipScene = simpleGameEngine('Battleship.png',84,84);


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

%This is the title screen. Just a blank board with water sprites
titleScreen = water_sprite * ones(10,21);

%Winner's Board This is the board displayed for when someone wins
winnerBoard = hit_sprite * ones(10,21);


%Player 1's board. This is where player 1 keeps their ship and where they
%can attack
player1Board = water_sprite * ones(10,21);
player1Board(:,11) = blank_sprite;

%passing board. This is a board that is shown when players pass the
%computer from each other. 
blankBoard = vert_ship_sprite * ones(10,21);
blankBoard(:,11) = hit_sprite;

%Player 2's board. This is where player 2 keeps their ship and where they
%can attack
player2Board = water_sprite * ones(10,21);
player2Board(:,11) = blank_sprite;

%Draws title screen and gives player option to play or exit
drawScene(battleshipScene, titleScreen)
title('Welcome to Battleship, left click to play game, right click to exit')
[r,c,b] = getMouseInput(battleshipScene);



%While loop to allow player to replay game
while b == 1
    %Dialogue box is prompted and after user clicks ok player 1's board is
    %shown
    questdlg('Welcome to Battleship! Left click to place ship down. Right click to place ship to the right. Enjoy :)', 'Battleship Instructions', 'ok', 'ok')
drawScene(battleshipScene, player1Board);
title(['Player 1 Board                                                ' ...
    '                                                                 ' ...
    '                                                          ']);
xlabel('Place your aircraft carrier (5 tiles long)');

% Place Aircraft for player 1
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
%While loop makes sure player's placement is valid
while ship == 0
    if (b == 1 && r <= 6 && c < 11 && sum(player1Board(r:r+4,c)) == 10)
        player1Board(r,c) = top_ship_sprite;
        player1Board(r+1:r+3,c) = vert_ship_sprite;
        player1Board(r+4,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c <= 6 && sum(player1Board(r,c:c+4)) == 10)
        player1Board(r,c) = left_ship_sprite;
        player1Board(r,c+1:c+3) = horiz_ship_sprite;
        player1Board(r,c+4) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        drawScene(battleshipScene, player1Board);
        [r,c,b] = getMouseInput(battleshipScene);
    end
end


% Place Destroyer Works the exact same as aircraft carrier but with a 4
% tile long ship
drawScene(battleshipScene, player1Board);
xlabel('Place your destroyer (4 tiles long)');
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
while ship == 0
    if (b == 1 && r <= 7 && c < 11 && sum(player1Board(r:r+3,c)) == 8)
        player1Board(r,c) = top_ship_sprite;
        player1Board(r+1:r+2,c) = vert_ship_sprite;
        player1Board(r+3,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c <= 7 && sum(player1Board(r,c:c+3)) == 8)
        player1Board(r,c) = left_ship_sprite;
        player1Board(r,c+1:c+2) = horiz_ship_sprite;
        player1Board(r,c+3) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
end


% Place first battleship. 
drawScene(battleshipScene, player1Board);
xlabel('Place your first battleship (3 tiles long)');
 [r,c,b] = getMouseInput(battleshipScene);
player1Board = p1BattleShips(r, c, b, battleshipScene, player1Board);
drawScene(battleshipScene, player1Board);

% Place second battleship
drawScene(battleshipScene, player1Board);
xlabel('Place your second battleship (3 tiles long)');
 [r,c,b] = getMouseInput(battleshipScene);
player1Board = p1BattleShips(r, c, b, battleshipScene, player1Board);
drawScene(battleshipScene, player1Board);


% Place submarine
drawScene(battleshipScene, player1Board);
xlabel('Place your submarine (2 tiles long)');
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
while ship == 0
    if (b == 1 && r <= 9 && c < 11 && sum(player1Board(r:r+1,c)) == 4)
        player1Board(r,c) = top_ship_sprite;
        player1Board(r+1,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c <= 9 && sum(player1Board(r,c:c+1)) == 4)
        player1Board(r,c) = left_ship_sprite;
        player1Board(r,c+1) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
end
drawScene(battleshipScene, player1Board);

%Passes to other player. Pauses the screen, then user is able to click
%anywhere to get to player 2 board.
pause(0.5);
title('Pass to other player click anywhere');
xlabel('')
drawScene(battleshipScene, blankBoard);
[~,~,b] = getMouseInput(battleshipScene);

%Player clicks and then player 2's board is show
if b>0
drawScene(battleshipScene, player2Board);
title(['                                              ' ...
    '                                               ' ...
    '                                                 Player 2 Board']);
xlabel('Place your aircraft carrier (5 tiles long)')
end

% Place Aircraft Exact same logic as player 1
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
while ship == 0
    if (b == 1 && r <= 6 && c > 11 && sum(player2Board(r:r+4,c)) == 10)
        player2Board(r,c) = top_ship_sprite;
        player2Board(r+1:r+3,c) = vert_ship_sprite;
        player2Board(r+4,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c > 11 && c <= 17 && sum(player2Board(r,c:c+4)) == 10)
        player2Board(r,c) = left_ship_sprite;
        player2Board(r,c+1:c+3) = horiz_ship_sprite;
        player2Board(r,c+4) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        drawScene(battleshipScene, player2Board);
        [r,c,b] = getMouseInput(battleshipScene);
    end
end

% Place Destroyer
drawScene(battleshipScene, player2Board);
xlabel('Place your destroyer (4 tiles long)');
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
while ship == 0
    if (b == 1 && r <= 7 && c > 11 && sum(player2Board(r:r+3,c)) == 8)
        player2Board(r,c) = top_ship_sprite;
        player2Board(r+1:r+2,c) = vert_ship_sprite;
        player2Board(r+3,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c > 11 && c <= 18 && sum(player2Board(r,c:c+3)) == 8)
        player2Board(r,c) = left_ship_sprite;
        player2Board(r,c+1:c+2) = horiz_ship_sprite;
        player2Board(r,c+3) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
end


% Place first battleship
drawScene(battleshipScene, player2Board);
xlabel('Place your first battleship (3 tiles long)');
 [r,c,b] = getMouseInput(battleshipScene);
player2Board = p2BattleShips(r, c, b, battleshipScene, player2Board);
drawScene(battleshipScene, player2Board);


% Place second battleship
drawScene(battleshipScene, player2Board);
xlabel('Place your second battleship (3 tiles long)');
 [r,c,b] = getMouseInput(battleshipScene);
player2Board = p2BattleShips(r, c, b, battleshipScene, player2Board);
drawScene(battleshipScene, player2Board);

% Place submarine
drawScene(battleshipScene, player2Board);
xlabel('Place your submarine (2 tiles long)')
[r,c,b] = getMouseInput(battleshipScene);
ship = 0;
while ship == 0
    if (b == 1 && r <= 9 && c > 11 && sum(player2Board(r:r+1,c)) == 4)
        player2Board(r,c) = top_ship_sprite;
        player2Board(r+1,c) = bot_ship_sprite;
        ship = ship + 1;
    elseif (b == 3 && c > 11 && c <= 20 && sum(player2Board(r,c:c+1)) == 4)
        player2Board(r,c) = left_ship_sprite;
        player2Board(r,c+1) = right_ship_sprite;
        ship = ship + 1;
    else
        xlabel('Invalid move. Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
end

%Draws player 2's screen at end
drawScene(battleshipScene, player2Board);
xlabel('')

%Variables hold the amount of hits each player gets
player1Hit = 0;
player2Hit = 0;

%counts amounts of hits to determine if player has won
while (player1Hit < 17 && player2Hit < 17)
%pauses a second for players to pass
pause(0.5);
title('Pass to other player click anywhere');
drawScene(battleshipScene, blankBoard);
[r,c,b] = getMouseInput(battleshipScene);
drawScene(battleshipScene, player1Board);
   title('Player 1 Attack The Right Board')
%player 1 hits
[r,c,b] = getMouseInput(battleshipScene);
        p1Validation = 0;
    while p1Validation == 0
        if(player1Board(r,c) == miss_sprite || ...
           player1Board(r,c) == hit_sprite)
           title('Invalid Move P1, Please Try again')
            [r,c] = getMouseInput(battleshipScene);

        elseif(player2Board(r,c) ~= water_sprite && c > 11)

          player1Board(r,c) = hit_sprite;
          player2Board(r,c) = hit_sprite;
          player1Hit = player1Hit + 1;
          p1Validation = 1;
          drawScene(battleshipScene, player1Board);

        elseif (player2Board(r,c) == water_sprite && c > 11)
            player1Board(r,c) = miss_sprite;
            player2Board(r,c) = miss_sprite;
            drawScene(battleshipScene, player1Board);
            p1Validation = 1;
        else
            title('Invalid Move P1, Please Try again')
            [r,c] = getMouseInput(battleshipScene);
        end
    end
    %Prompts users to change
    if player1Hit < 17
    pause(0.5);
    title('Pass to other player click anywhere');
    drawScene(battleshipScene, blankBoard);
    getMouseInput(battleshipScene);
    drawScene(battleshipScene, player2Board);
   title('Player 2 Attack The Left Board')
   
       %Player 2 Attacks
       p2Validation = 0;
       while p2Validation == 0
    [r,c] = getMouseInput(battleshipScene);


     if(player2Board(r,c) == miss_sprite || ...
           player2Board(r,c) == hit_sprite)
           title('Invalid Move P2, Please Try again')
            [r,c,b] = getMouseInput(battleshipScene);

     elseif(player1Board(r,c) ~= water_sprite && c < 11)
        player2Board(r,c) = hit_sprite;
        player1Board(r,c) = hit_sprite;
        player2Hit = player2Hit + 1;
        drawScene(battleshipScene, player2Board);
           p2Validation = 1;

    elseif (player1Board(r,c) == water_sprite && c < 11)
        player2Board(r,c) = miss_sprite;
        player1Board(r,c) = miss_sprite;
        drawScene(battleshipScene, player2Board);
        p2Validation = 1;

    else
        title('Invalid Move P2, Please Try again')
        [r,c,b] = getMouseInput(battleshipScene);
    end
       end

    end
end

%Prompts Winner title 
if player1Hit > player2Hit
    drawScene(battleshipScene, winnerBoard)
    title('Player 1 Wins Click Anywhere')
    getMouseInput(battleshipScene);
else
    drawScene(battleshipScene, winnerBoard)
    title('Player 2 Wins Click Anywhere')
    getMouseInput(battleshipScene);
end

%Asks player if they want to play again
drawScene(battleshipScene, titleScreen)
    title('Left Click to Play Again Right Click to Exit')
[r,c,b] = getMouseInput(battleshipScene);

end

%Final screen if players quit playing
drawScene(battleshipScene, titleScreen)
title('Thank you for playing!')

%after ending screen, game closes
pause(1.0)
close all
clear all
clc