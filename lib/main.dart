import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.cairoTextTheme(const TextTheme()),
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    if (board[index].isEmpty) {
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
        showResultDialog(true);
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        showResultDialog(true);
      }
    }

    if (!thereIsAWinner) {
      if (board[0].isNotEmpty && board[0] == board[4] && board[0] == board[8]) {
        showResultDialog(true);
      } else if (board[2].isNotEmpty &&
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
      board[i] = '';
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
