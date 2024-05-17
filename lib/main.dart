import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

  bool exTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: gameBoard(),
    );
  }

  Widget gameBoard() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: board.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => tapped(index),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: FittedBox(
            child: Text(
              board[index],
            ),
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    if (board[index].isEmpty) {
      setState(() {
        board[index] = exTurn ? 'x' : 'o';
      });
      exTurn = !exTurn;
      checkWinner();
    }
  }

  void checkWinner() {
    print(board);
    if (board[0] == board[1] && board[1] == board[2]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[3] == board[4] && board[4] == board[5]) {
      print("${board[3]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[6] == board[7] && board[7] == board[8]) {
      print("${board[6]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[0] == board[3] && board[3] == board[6]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[1] == board[4] && board[4] == board[7]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[2] == board[5] && board[5] == board[8]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[0] == board[4] && board[4] == board[8]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }

    if (board[2] == board[4] && board[4] == board[6]) {
      print("${board[0]} winner");
      setState(() {
        clearBoard();
      });
    }
  }

  void clearBoard() {
    for (int i = 0; i < board.length; i++) {
      board[i] = '';
    }
  }
}
