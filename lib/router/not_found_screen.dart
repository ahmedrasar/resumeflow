import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen(this.state, {super.key});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.error,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
              opacity: 0.25,
              child: Icon(Icons.warning, size: 300),
            ),
            Text(
              '404 NOT FOUND',
              style: Theme.of(context).textTheme.displayLarge,
              textDirection: TextDirection.ltr,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Router Error: ${state.error}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text(
                    'Go Home',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
