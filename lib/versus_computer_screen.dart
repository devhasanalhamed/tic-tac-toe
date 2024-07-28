import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_too/core/function/tic_tac_toe_logic.dart';

import 'package:tic_tac_too/widget/your_turn_widget.dart';
import 'core/function/show_result.dart';

class VersusComputerScreen extends StatefulWidget {
  const VersusComputerScreen({super.key});

  @override
  State<VersusComputerScreen> createState() => _VersusComputerScreenState();
}

enum ComputerState {
  standBy,
  progress,
}

class _VersusComputerScreenState extends State<VersusComputerScreen> {
  final List<int> board = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  bool isPlayerOne = true;
  String playerOne = 'إكس';
  String playerTwo = 'أوه';
  bool thereIsAWinner = false;
  String? winnerName;
  int playerOneScore = 0;
  int playerTwoScore = 0;
  int roundCount = 0;
  bool showPlayAgainButton = false;
  ComputerState computerState = ComputerState.standBy;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 128.0,
                      child: YourTurnWidget(
                        playerName: isPlayerOne ? playerOne : playerTwo,
                        isPlayerOne: isPlayerOne,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              playerOne,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '$playerOneScore',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              playerTwo,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '$playerTwoScore',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.blue,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: board.length,
                        itemBuilder: (context, index) {
                          final String playerTag;
                          final Color playerColor;
                          if (board[index] == 1) {
                            playerTag = "x";
                            playerColor = Colors.red;
                          } else if (board[index] == -1) {
                            playerTag = "o";
                            playerColor = Colors.blue;
                          } else {
                            playerTag = "";
                            playerColor = Colors.black;
                          }
                          return InkWell(
                            onTap: () => tapped(index),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white70,
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  playerTag,
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: playerColor,
                                        blurRadius: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        thereIsAWinner ? clearBoard() : resetGame();
                      }),
                      child: Text(
                        showPlayAgainButton ? "اللعب مجدداً" : "إعادة تعيين",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (computerState == ComputerState.progress)
                Container(
                  color: Colors.white10,
                  width: double.infinity,
                  height: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void tapped(int index) async {
    if (board[index] == 0 && !thereIsAWinner) {
      setState(() {
        setValueAtIndex(index, 1);
      });
      if (!thereIsAWinner) {
        await computerTurn();
        setState(() {
          computerState = ComputerState.standBy;
        });
      }
    } else {
      print('Wrong move');
    }
  }

  Future<void> computerTurn() async {
    // Computer turn
    setState(() {
      computerState = ComputerState.progress;
    });

    await Future.delayed(
      const Duration(seconds: 4),
    );

    if (board[4] == 0) {
      setValueAtIndex(4, -1);

      return;
    }
    if (board[0] + board[1] + board[2] == 2) {
      if (board[0] == 0) {
        setValueAtIndex(0, -1);

        return;
      } else if (board[1] == 0) {
        setValueAtIndex(1, -1);

        return;
      } else {
        setValueAtIndex(2, -1);

        return;
      }
    }

    if (board[3] + board[4] + board[5] == 2) {
      if (board[3] == 0) {
        setValueAtIndex(3, -1);

        return;
      } else if (board[4] == 0) {
        setValueAtIndex(4, -1);

        return;
      } else {
        setValueAtIndex(5, -1);

        return;
      }
    }

    if (board[6] + board[7] + board[8] == 2) {
      if (board[6] == 0) {
        setValueAtIndex(6, -1);

        return;
      } else if (board[7] == 0) {
        setValueAtIndex(7, -1);

        return;
      } else {
        setValueAtIndex(8, -1);

        return;
      }
    }

    if (board[0] + board[3] + board[6] == 2) {
      if (board[0] == 0) {
        setValueAtIndex(0, -1);

        return;
      } else if (board[3] == 0) {
        setValueAtIndex(3, -1);

        return;
      } else {
        setValueAtIndex(6, -1);

        return;
      }
    }

    if (board[1] + board[4] + board[7] == 2) {
      if (board[1] == 0) {
        setValueAtIndex(1, -1);

        return;
      } else if (board[4] == 0) {
        setValueAtIndex(4, -1);

        return;
      } else {
        setValueAtIndex(7, -1);

        return;
      }
    }

    if (board[2] + board[5] + board[8] == 2) {
      if (board[2] == 0) {
        setValueAtIndex(2, -1);

        return;
      } else if (board[5] == 0) {
        setValueAtIndex(5, -1);

        return;
      } else {
        setValueAtIndex(8, -1);

        return;
      }
    }

    if (board[0] + board[4] + board[8] == 2) {
      if (board[0] == 0) {
        setValueAtIndex(0, -1);

        return;
      } else if (board[4] == 0) {
        setValueAtIndex(4, -1);

        return;
      } else {
        setValueAtIndex(8, -1);

        return;
      }
    }

    if (board[2] + board[4] + board[6] == 2) {
      if (board[2] == 0) {
        setValueAtIndex(2, -1);

        return;
      } else if (board[4] == 0) {
        setValueAtIndex(4, -1);

        return;
      } else {
        setValueAtIndex(6, -1);

        return;
      }
    }

    while (!thereIsAWinner && roundCount < 9) {
      print("problem");
      int random = Random().nextInt(8);
      if (board[random] == 0) {
        setState(() {
          setValueAtIndex(random, -1);
        });
        break;
      }
    }
  }

  void setValueAtIndex(int index, int value) {
    board[index] = value;
    roundCount += 1;
    bool? result = ticTacToeLogic(board, roundCount);
    if (result == true) {
      thereIsAWinner = true;
      if (isPlayerOne) {
        winnerName = playerOne;
        playerOneScore += 1;
      } else {
        winnerName = playerTwo;
        playerTwoScore += 1;
      }
      showResultDialog();
    } else if (result == false) {
      showResultDialog();
    }
  }

  void showResultDialog() {
    resultDialog(
      context: context,
      isWin: thereIsAWinner,
      winnerName: winnerName,
      continueFunction: () {
        setState(() {
          isPlayerOne = !isPlayerOne;
          clearBoard();
          Navigator.pop(context);
        });
      },
      skipFunction: () {
        setState(() {
          showPlayAgainButton = true;
          Navigator.pop(context);
        });
      },
    );
  }

  void clearBoard() {
    roundCount = 0;
    thereIsAWinner = false;
    showPlayAgainButton = false;
    winnerName = null;
    for (int i = 0; i < board.length; i++) {
      board[i] = 0;
    }
  }

  void resetGame() {
    clearBoard();
    playerOneScore = 0;
    playerTwoScore = 0;
  }
}
