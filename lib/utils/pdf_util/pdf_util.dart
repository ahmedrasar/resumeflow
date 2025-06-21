import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resumeflow/models/document_models/document_models.dart';

abstract class PdfUtil<T extends DocumentModel> {
  static Future<Uint8List> buildEmptyPage() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          // Return a trasparent widget
          return pw.Placeholder(color: PdfColors.white);
        },
      ),
    );
    return await pdf.save();
  }

  const PdfUtil();

  Future<Uint8List> fromModel(T model);
}

abstract class CoverLetterPdfUtilBase extends PdfUtil<CoverLetterModel> {
  const CoverLetterPdfUtilBase();
}

abstract class ResumePdfUtilBase extends PdfUtil<ResumeModel> {
  const ResumePdfUtilBase();
}
