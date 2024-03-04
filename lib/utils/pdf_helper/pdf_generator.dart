import 'package:flutter/services.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:quizzy_app/utils/pdf_helper/pdf_converter_to_image.dart';
import 'dart:io';

class PdfGenerator {
  static late Font arFont;

  static init() async {
    arFont =
        Font.ttf((await rootBundle.load("assets/fonts/Cairo-Regular.ttf")));
  }

  static void createPdf() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File(path + "/5000.pdf");

    Document pdf = Document();
    pdf.addPage(_createPage());

    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
    //  createImg(file.path);
    print(file.path);
    // await pdfx.PdfDocument.openFile(file.path);
    await OpenFile.open(file.path);

    /*
final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/sample.pdf'),
);

// Simple Pdf view with one render of page (loose quality on zoom)
PdfView(
  controller: pdfController,
);

    */
  }

  static Page _createPage() {
    return Page(
        //  textDirection: TextDirection.rtl,
        theme: ThemeData.withFont(
          base: arFont,
        ),
        pageFormat: PdfPageFormat.roll80,
        build: (context) {
          return Center(
              child: Container(
            child: Text(
              "Mohamede",
            ),
          ));
        });
  }

  static createImg(String path) {
    PdfConverter.convertToImage(path);
  }
}
