import 'package:flutter/cupertino.dart';

class YourTurnWidget extends StatelessWidget {
  final String playerName;

  const YourTurnWidget({
    required this.playerName,
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
      ],
    );
  }
}
