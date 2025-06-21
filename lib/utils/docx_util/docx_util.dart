import 'package:flutter/foundation.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/document_models/document_models.dart';

abstract class DocxUtil<T> {
  @protected
  static const String recipientNameKey = 'company-name';
  @protected
  static const String applicantNameKey = 'applicant-name';
  @protected
  static const String addressKey = 'address';
  @protected
  static const String telephoneKey = 'telephone';
  @protected
  static const String emailKey = 'email';
  @protected
  static const String bodyKey = 'body';

  late ResumeflowLocalizations? _l10n;

  set l10n(ResumeflowLocalizations l10n) => _l10n = l10n;
  @protected
  ResumeflowLocalizations get l10n => _l10n!;

  Future<void> init();
  Future<Uint8List> fromModel(T model);
}

abstract class CoverLetterDocxUtilBase extends DocxUtil<CoverLetterModel> {}

abstract class ResumeDocxUtilBase extends DocxUtil<ResumeModel> {}

class DocxUtilException implements Exception {
  final String message;

  DocxUtilException(this.message);

  @override
  String toString() => 'CoverLetterDocxException: $message';
}
