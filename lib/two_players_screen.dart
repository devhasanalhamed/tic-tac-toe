import 'package:flutter/material.dart';
import 'package:tic_tac_too/core/function/tic_tac_toe_logic.dart';
import 'package:tic_tac_too/widget/your_turn_widget.dart';
import 'core/function/show_result.dart';

class TwoPlayersScreen extends StatefulWidget {
  const TwoPlayersScreen({super.key});

  @override
  State<TwoPlayersScreen> createState() => _TwoPlayersScreenState();
}

class _TwoPlayersScreenState extends State<TwoPlayersScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  constraints: const BoxConstraints(
                    maxWidth: 400.0,
                    maxHeight: 400.0,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
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
        ),
      ),
    );
  }

  void tapped(int index) {
    if (board[index] == 0 && !thereIsAWinner) {
      setState(() {
        board[index] = isPlayerOne ? 1 : -1;
      });
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
      if (!thereIsAWinner) isPlayerOne = !isPlayerOne;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("حركة خاطئة!"),
          duration: Duration(seconds: 1),
        ),
      );
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
