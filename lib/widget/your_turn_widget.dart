import 'package:flutter/material.dart';

class YourTurnWidget extends StatelessWidget {
  final String playerName;
  final bool isPlayerOne;

  const YourTurnWidget({
    required this.playerName,
    required this.isPlayerOne,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          playerName,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: isPlayerOne ? Colors.red : Colors.blue,
              shadows: [
                Shadow(
                  color: isPlayerOne ? Colors.red : Colors.blue,
                  blurRadius: 16.0,
                ),
              ]),
        ),
      ],
    );
  }
}
