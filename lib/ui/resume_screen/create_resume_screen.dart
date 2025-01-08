import 'package:flutter/material.dart';

import '../widgets/grid_background.dart';

class CreateResumeScreen extends StatefulWidget {
  const CreateResumeScreen({super.key});

  @override
  State<CreateResumeScreen> createState() => _CreateResumeScreenState();
}

class _CreateResumeScreenState extends State<CreateResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GridBackground(
        child: Placeholder(),
      ),
    );
  }
}
