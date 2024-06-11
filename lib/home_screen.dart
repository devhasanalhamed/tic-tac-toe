import 'package:flutter/material.dart';
import 'package:tic_tac_too/two_players_screen.dart';
import 'package:tic_tac_too/versus_computer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    border: Border.all(
                      color: Colors.amber,
                      width: 2.0,
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.amberAccent,
                        blurRadius: 4.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  transform: Matrix4.rotationZ(-0.1),
                  height: 200,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "أوه",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.blue,
                              blurRadius: 16.0,
                            ),
                          ],
                          fontSize: 48.0,
                        ),
                      ),
                      Text(
                        " أو ",
                        style: TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        "إكس",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.red,
                              blurRadius: 16.0,
                            ),
                          ],
                          fontSize: 48.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TwoPlayersScreen(),
                    ),
                  ),
                  label: const Text("لاعب ضد لاعب"),
                  icon: const Icon(
                    Icons.people,
                  ),
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(Size(0, 60)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  label: const Text("لاعب ضد الكمبيوتر"),
                  icon: const Icon(
                    Icons.laptop,
                  ),
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(Size(0, 60)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VersusComputerScreen(),
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
}
