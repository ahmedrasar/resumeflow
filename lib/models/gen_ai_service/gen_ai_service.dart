import 'package:flutter/foundation.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/document_models/document_models.dart';

abstract class GenAiService {
  @protected
  final AcquiredData acquiredData;
  @protected
  final ResumeflowLocalizations l10n;
  const GenAiService(this.acquiredData, this.l10n);

  Future<CoverLetterGenData?> genCoverLetter();
  Future<ResumeGenData?> genResume();
}

class GenAiException implements Exception {
  final int code;
  final String message;
  const GenAiException(this.code, this.message);

  @override
  String toString() => 'GenAiException:\n code: $code\n message: $message';
}
