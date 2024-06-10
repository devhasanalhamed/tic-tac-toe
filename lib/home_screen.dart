import 'package:flutter/material.dart';
import 'package:tic_tac_too/two_players_screen.dart';
import 'package:tic_tac_too/versus_computer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TwoPlayersScreen(),
                  ),
                ),
                child: const Text("لعبة لـ لاعبين إثنين 🤺"),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VersusComputerScreen(),
                  ),
                ),
                child: const Text("ضد الكمبيوتر 💻"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
