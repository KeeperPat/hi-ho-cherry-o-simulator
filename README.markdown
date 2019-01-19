# Hi-Ho! Cherry-O Simulator
An Overly Serious Analysis of the children's game "Hi-Ho!! Cherry-O"

This program runs a Monte Carlo Simulation to determine the relative probability of winning based on starting position.

## Rules of Hi-Ho! Cherry-O
_Source: [Wikipedia](https://en.wikipedia.org/wiki/Hi_Ho!_Cherry-O)_

Each player starts the game with an empty basket and 10 cherries on his/her tree. Players take turns spinning the spinner and performing the indicated action. The spinner is divided into seven sections:

* Take one cherry off of the tree
* Take two cherries off of the tree
* Take three cherries off of the tree
* Take four cherries off of the tree
* Dog: Replace cherries on tree: Replace two one the tree if the player has at least two. Replace one if the player has at least that many. If the player has zero cherries, it would have no effect and you would basically skip that player's turn
* Bird: Same thing as the dog
* Spilled basket: Replace all of the cherries on your tree

The first player to collect all the cherries from his/her tree and call "Hi Ho! Cherry-O" wins the game.

## TODO
- [ ] Update probabilities
- [ ] Record length of games to show percentiles of how long games take 
- [ ] Record intermediate data on log scale so I can graph converging probabilities
