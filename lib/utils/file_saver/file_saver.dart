import 'file_saver_io.dart' if (dart.library.html) 'file_saver_web.dart';

import 'package:resumeflow/models/coverletter_models/coverletter_models.dart';
import 'package:resumeflow/services/coverletter_docx/coverletter_docx.dart';

class FileSaver {
  static Future<bool> saveCoverLetter(CoverletterModel model,
      {required String prompt}) async {
    final bytes = await CoverletterDocx.fromModel(model);
    final fileName = '${model.recipientName}-cover-letter.docx';
    return TargetFileSaver().saveFile(bytes!, fileName, prompt, 'docx');
  }
}
