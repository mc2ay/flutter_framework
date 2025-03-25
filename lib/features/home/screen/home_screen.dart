import 'package:flutter/material.dart';
import 'package:app/features/chat/screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return  const ChatScreen(
                        name: 'Atom Yongya',
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Atom Yongya',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ChatScreen(
                        name: 'Other User',
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Other User',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
