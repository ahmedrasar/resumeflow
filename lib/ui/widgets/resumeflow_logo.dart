import 'package:flutter/material.dart';
import 'package:resumeflow/constants/asset_paths/asset_paths.dart';

class ResumeflowLogo extends StatelessWidget {
  const ResumeflowLogo({super.key});
  static const heroTag = '-hero-resumeflow-logo-tag';

  @override
  Widget build(BuildContext context) =>
      Image.asset(AssetPaths.resumeflowLogoPath);
}
