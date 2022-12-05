
%This is where you should put all you setup information. This includes
%turning off all warnings, having variables to initialize setup, and
%creating a variable to hold the game scene that is initialized by the
%simple game engine.


%All the sprites used for the game should be initialized here. These
%sprites would include blank sprite, water sprite, hit sprite, miss sprite,
%and the sprites used for for the vertical, horizontal, and middle
%battleship sprites.


%This is where each board sprite should be initialized. There are 5 main
%boards used throughout the game. The first one is a title screen which is
%just blank water sprites. This is used for displaying the game. The next 2
%are player board sprites. These will hold the ships and attacks of each
%player. They each get their own board. There should be a blank screen as a
%passing sprite. This is a netural background that the players can use to
%pass the computer to ech other without revealing their boards. The final
%one is a winner board that shows the game ends and tells you who won the
%game. 


%Here the title screen should be drawn welcoming the player and giving then
%the option to play the game or quit


%There can easily be a while loop surrounding the entire program to make
%the game repeatable. The start can be true and after the game is complete
%can change to false to quit the loop or stay the same to repeat the game.


%There should be a dialogue box to explain the rules of the game and after
%users read the box they can click out of it and start the game.


%For the user to place the aircraft carrier, the first click can be the top
%or left point. Using the right and left clicks can allow the user to place
%the ship in their preferred orientation. A simple if elseif else branch
%inside a while loop can be used for input validation. If user does a left
%click, the ship is placed vertically if it is within the bounds, if right
%click then horizontally. If these branches are invalid based on user
%placement, then user is prompted again to place their ship and the loop
%continues. Loop breaks when user makes a valid ship placement. This is
%done for player 1.


%This same idea is repeated for the destroyer for player one. The same loop
%and validation can be used. The bounds for the ship and ship size are the
%only things that need to change. The only other difference would be
%renaming part of the board telling the user to place the destroyer. 

%This idea can be repeated with a different prompt and changing the bounds
%to place the first and second battleships. A function could be used for
%the battleships because they are the same size. 


%Same idea as before can be used to place the submarines from the user with
%a different prompt and user validation.


%After player 1 places all their ships, there can be a pause and then the
%passing screen can be loaded. This screen is essentially blank to allow
%the player to pass the laptop to each other without having to worry about
%having their screen revealed. 


%A user click can be used on the passing board when player 2 is ready to
%start so they can place their ships.


%Player 2's board is loaded and the exact same idea for placing each ship
%is used for player two except it is done on the right board. Same
%validation concepts can be used except the bounds have to be changed. 


%Same concept as player 1 can be used with different bounds to place the
%aircraft carrier. Only difference is that it is loaded to player 2's game
%board

%Same concept as above can be used for player 2's destroyer. 


%Same concept as above can be used for player 2's first battleship 


%Same concept as above can be used for player 2's second battleship 


%After player 2's battleships are placed, the passing screen can be shown
%again for player 1 to take the laptop and click on the screen.


%The easiest way to know when a player wins their game is by how many times
%they have a hit sprite. Having a hit counter and setting it to zero and
%implementing it by 1 everytime until they reach 17 can tell us who is the
%victor. 17 is the max amount of hits because that would mean a player hit
%all the opponents ships. 


%A while loop can be used to determine if the game should kept being
%played. If a player reaches 17 hits the game ends. A while loop can have
%three parts to it. First, it pauses and shows the passing screen for each
%player to click on. Then player 1 makes their attack. They attack, on
%the other board that is blank. The waiting screen shows up again. 
%Then player 2 is able to see where player 1 attacked overlayed on their
%ships side of the board. Player 2 attacks. Then the passing screen is
%shown again and this is repeated. Everytime a player gets a hit, then
%their hit counter goes up until one reaches 17. That concludes the loop
%and then the winner is outputted. 


%The winner is prompted and the title changes based on which player had 17
%wins concluding the game


%After winner screen is shown, the user can left click to play the game
%again, or right click to quit the game. If user left clicks the game
%starts over.

%If user right clicks, the title screen is shown again and the players are
%thanked for playing. There is a pause and then the game closes
%automatically.
