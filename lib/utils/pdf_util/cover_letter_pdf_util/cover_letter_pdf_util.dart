import 'package:flutter/foundation.dart';
import 'package:resumeflow/models/document_models/cover_letter_models/cover_letter_models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resumeflow/utils/pdf_util/pdf_theme_data.dart';
import 'package:resumeflow/utils/pdf_util/pdf_util.dart';

class CoverLetterPdfUtil extends CoverLetterPdfUtilBase {
  const CoverLetterPdfUtil();

  @override
  Future<Uint8List> fromModel(CoverLetterModel model) async {
    final pdf = pw.Document(theme: pdfThemeData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(model.name, style: pdf.theme!.header0),
              pw.SizedBox(height: 20),
              pw.Text(model.address),
              pw.Text(model.telephone),
              pw.Text(model.email),
              pw.SizedBox(height: 20),
              pw.Text(model.body, textAlign: pw.TextAlign.justify),
            ],
          );
        },
      ),
    );

    return await pdf.save();
  }
}
