import 'file_saver_io.dart' if (dart.library.html) 'file_saver_web.dart';

import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/services/cover_letter_docx/cover_letter_docx.dart';

class FileSaver {
  static Future<bool> saveCoverLetter(CoverLetterModel model,
      {required String prompt}) async {
    final bytes = await CoverLetterDocx.fromModel(model);
    final fileName = '${model.recipientName}-cover-letter.docx';
    return TargetFileSaver().saveFile(bytes!, fileName, prompt, 'docx');
  }
}
