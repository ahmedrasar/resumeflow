import 'package:flutter/material.dart';
import 'package:resumeflow/ui/tutorial_screen/tutorial_grid.dart';

import '../widgets/grid_background.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(child: TutorialGrid()),
        ),
      ),
    );
  }
}
