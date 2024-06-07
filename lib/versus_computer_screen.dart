import 'dart:math';

import 'package:flutter/material.dart';

class VersusComputerScreen extends StatefulWidget {
  const VersusComputerScreen({super.key});

  @override
  State<VersusComputerScreen> createState() => _VersusComputerScreenState();
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
                            board[index] == 0
                                ? ''
                                : board[index] == 1
                                    ? 'x'
                                    : 'o',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: board[index] == 1
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    if (board[index] == 0) {
      setState(() {
        board[index] = isPlayerOne ? 1 : -1;
      });
      counter += 1;
      checkWinner();
    } else {
      print('Wrong move');
    }

    computerTurn();
  }

  Future<void> computerTurn() async {
    // Computer turn

    if (board[4] == 0) {
      board[4] = -1;
      counter += 1;
      return;
    }
    if (board[0] + board[1] + board[2] == 2) {
      if (board[0] == 0) {
        board[0] = -1;
        counter += 1;

        return;
      } else if (board[1] == 0) {
        board[1] = -1;
        counter += 1;
        return;
      } else {
        board[2] = -1;
        counter += 1;
        return;
      }
    }

    if (board[3] + board[4] + board[5] == 2) {
      if (board[3] == 0) {
        board[3] = -1;
        counter += 1;

        return;
      } else if (board[4] == 0) {
        board[4] = -1;
        counter += 1;

        return;
      } else {
        board[5] = -1;
        counter += 1;

        return;
      }
    }

    if (board[6] + board[7] + board[8] == 2) {
      if (board[6] == 0) {
        board[6] = -1;
        counter += 1;

        return;
      } else if (board[7] == 0) {
        board[7] = -1;
        counter += 1;

        return;
      } else {
        board[8] = -1;
        counter += 1;

        return;
      }
    }

    if (board[0] + board[3] + board[6] == 2) {
      if (board[0] == 0) {
        board[0] = -1;
        counter += 1;

        return;
      } else if (board[3] == 0) {
        board[3] = -1;
        counter += 1;

        return;
      } else {
        board[6] = -1;
        counter += 1;

        return;
      }
    }

    if (board[1] + board[4] + board[7] == 2) {
      if (board[1] == 0) {
        board[1] = -1;
        counter += 1;

        return;
      } else if (board[4] == 0) {
        board[4] = -1;
        counter += 1;

        return;
      } else {
        board[7] = -1;
        counter += 1;

        return;
      }
    }

    if (board[2] + board[5] + board[8] == 2) {
      if (board[2] == 0) {
        board[2] = -1;
        counter += 1;

        return;
      } else if (board[5] == 0) {
        board[5] = -1;
        counter += 1;

        return;
      } else {
        board[8] = -1;
        counter += 1;

        return;
      }
    }

    if (board[0] + board[4] + board[8] == 2) {
      if (board[0] == 0) {
        board[0] = -1;
        counter += 1;

        return;
      } else if (board[4] == 0) {
        board[4] = -1;
        counter += 1;

        return;
      } else {
        board[8] = -1;
        counter += 1;

        return;
      }
    }

    if (board[2] + board[4] + board[6] == 2) {
      if (board[2] == 0) {
        board[2] = -1;
        counter += 1;

        return;
      } else if (board[4] == 0) {
        board[4] = -1;
        counter += 1;

        return;
      } else {
        board[6] = -1;
        counter += 1;

        return;
      }
    }

    while (true && !thereIsAWinner) {
      int random = Random().nextInt(8);
      if (board[random] == 0) {
        setState(() {
          board[random] = -1;
          counter += 1;
        });
        break;
      }
    }

    checkWinner();
  }

  void checkWinner() {
    print(board);

    for (int i = 0; i < board.length; i += 3) {
      if (board[i] != 0 &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        showResultDialog(true);
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i] != 0 &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        showResultDialog(true);
      }
    }

    if (!thereIsAWinner) {
      if (board[0] != 0 && board[0] == board[4] && board[0] == board[8]) {
        showResultDialog(true);
      } else if (board[2] != 0 &&
          board[2] == board[4] &&
          board[2] == board[6]) {
        showResultDialog(true);
      } else if (counter == 9) {
        showResultDialog(false);
      }
    }
  }

  void clearBoard() {
    counter = 0;
    thereIsAWinner = false;
    for (int i = 0; i < board.length; i++) {
      board[i] = 0;
    }
  }

  Future<void> showResultDialog(bool isWin) async {
    thereIsAWinner = true;
    if (isWin) isPlayerOne ? playerOneScore += 1 : playerTwoScore += 1;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      clearBoard();
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("اللعب مجدداً"),
                )
              ],
              title: Text(
                  isWin ? "مبرووووووووووووك 🥳" : "عوافي 🙂 نلعب مره ثانية"),
              content: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Text(
                  isWin
                      ? "ألف مبروك يا ${isPlayerOne ? playerOne : playerTwo} تستاهل الفوز، حاب نتحدى مرة ثانية؟"
                      : "هذه المرة الفوز من نصيبي أتحداك تفوز 🔥",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
