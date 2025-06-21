import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final pdfThemeData = pw.ThemeData(
  defaultTextStyle: pw.TextStyle(fontSize: 16),
  header0: pw.TextStyle(
    fontSize: 32,
    color: PdfColors.blue,
    fontWeight: pw.FontWeight.bold,
  ),
);
