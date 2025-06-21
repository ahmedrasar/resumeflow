import 'package:flutter/foundation.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/document_models/document_models.dart';

abstract class GenDataService<T extends GenData> {
  @protected
  final ResumeflowLocalizations l10n;
  const GenDataService(this.l10n);

  Future<T?> genData(AcquiredData acquiredData) async =>
      !isCompleteData(acquiredData)
          ? null
          : await genDataWhenComplete(acquiredData);
  @protected
  Future<T> genDataWhenComplete(AcquiredData acquiredData);
  bool isCompleteData(AcquiredData acquiredData);
}

abstract class CoverLetterDataGenService
    extends GenDataService<CoverLetterGenData> {
  const CoverLetterDataGenService(super.l10n);
}

abstract class ResumeDataGenService extends GenDataService<ResumeGenData> {
  const ResumeDataGenService(super.l10n);
}
