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

  final boardWin = [
    [0, 1, 2],
  ];

  bool isPlayerOne = true;
  String playerOne = 'إكس';
  String playerTwo = 'أوه';
  String? winner;
  String? winnerName;
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
        setValueAtIndex(index, 1);
      });
    } else {
      print('Wrong move');
    }
    if (!thereIsAWinner) {
      computerTurn();
    }
  }

  Future<void> computerTurn() async {
    // Computer turn

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

    while (true && !thereIsAWinner) {
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
    counter += 1;
    checkWinner();
    isPlayerOne = !isPlayerOne;
  }

  void checkWinner() {
    print(board);

    for (int i = 0; i < board.length; i += 3) {
      if (board[i] != 0 &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        winner = isPlayerOne ? playerOne : playerTwo;
        showResultDialog(true);
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i] != 0 &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        winner = isPlayerOne ? playerOne : playerTwo;

        showResultDialog(true);
      }
    }

    if (!thereIsAWinner) {
      if (board[0] != 0 && board[0] == board[4] && board[0] == board[8]) {
        winner = isPlayerOne ? playerOne : playerTwo;

        showResultDialog(true);
      } else if (board[2] != 0 &&
          board[2] == board[4] &&
          board[2] == board[6]) {
        winner = isPlayerOne ? playerOne : playerTwo;

        showResultDialog(true);
      } else if (counter == 9) {
        showResultDialog(false);
      }
    }
  }

  void clearBoard() {
    counter = 0;
    thereIsAWinner = false;
    winner = null;
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
                      ? "ألف مبروك يا $winner تستاهل الفوز، حاب نتحدى مرة ثانية؟"
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
