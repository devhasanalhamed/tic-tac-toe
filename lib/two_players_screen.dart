import 'package:flutter/material.dart';
import 'core/function/show_result.dart';

class TwoPlayersScreen extends StatefulWidget {
  const TwoPlayersScreen({super.key});

  @override
  State<TwoPlayersScreen> createState() => _TwoPlayersScreenState();
}

class _TwoPlayersScreenState extends State<TwoPlayersScreen> {
  final List<String> board = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool isPlayerOne = true;
  String playerOne = 'إكس';
  String playerTwo = 'أوه';
  bool thereIsAWinner = false;
  String? winnerName;
  int playerOneScore = 0;
  int playerTwoScore = 0;
  int counter = 0;

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
                Text(
                  "👀",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  "دورك يا",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  isPlayerOne ? playerOne : playerTwo,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: isPlayerOne ? Colors.red : Colors.blue,
                      shadows: [
                        Shadow(
                          color: isPlayerOne ? Colors.red : Colors.blue,
                          blurRadius: 16.0,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 32,
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
                  constraints: const BoxConstraints(maxWidth: 400.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: board.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => tapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white70,
                          ),
                        ),
                        child: FittedBox(
                          child: Text(
                            board[index],
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: board[index] == 'x'
                                      ? Colors.red
                                      : Colors.blue,
                                  blurRadius: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
                    thereIsAWinner ? "اللعب مجدداً" : "إعادة تعيين",
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
    if (board[index].isEmpty && !thereIsAWinner) {
      setState(() {
        board[index] = isPlayerOne ? 'x' : 'o';
      });
      counter += 1;
      checkWinner();
      if (!thereIsAWinner) isPlayerOne = !isPlayerOne;
    } else {
      print('Wrong move');
    }
  }

  void checkWinner() {
    print(board);

    for (int i = 0; i < board.length; i += 3) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        showResultDialog();
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        showResultDialog();
      }
    }

    if (!thereIsAWinner) {
      if (board[0].isNotEmpty && board[0] == board[4] && board[0] == board[8]) {
        showResultDialog();
      } else if (board[2].isNotEmpty &&
          board[2] == board[4] &&
          board[2] == board[6]) {
        showResultDialog();
      } else if (counter == 9) {
        showResultDialog();
      }
    }
  }

  void showResultDialog() {
    resultDialog(
      context: context,
      isWin: true,
      continueFunction: () {
        setState(() {
          clearBoard();
          Navigator.pop(context);
        });
      },
      skipFunction: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
  }

  void clearBoard() {
    counter = 0;
    thereIsAWinner = false;
    for (int i = 0; i < board.length; i++) {
      board[i] = '';
    }
  }

  void resetGame() {
    clearBoard();
    playerOneScore = 0;
    playerTwoScore = 0;
  }
}
