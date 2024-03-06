import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:quizzy_app/model/exam_attempt_model.dart';
import 'package:quizzy_app/utils/pdf_helper/pdf_converter_to_image.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'dart:io';

import 'package:quizzy_app/view/custom_component/exam_statistics/custom_card_exam_result.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_card_exam_result.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_card_exam_result.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_statistics_icon.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_statistics_text.dart';

import '../../view/custom_component/custom_button.dart';
import '../../view/custom_component/custom_button.dart';
import '../../view/custom_component/exam_statistics/custom_card_exam_result.dart';

class PdfGenerator {
  static late Font arFont;

  static init() async {
    arFont =
        pw.Font.ttf((await rootBundle.load("assets/fonts/Cairo-Regular.ttf")));
  }

  static void createPdf(
      {required ExamAttemptModel examAttemptStatisticsInofrmation}) async {
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File(path + "/5000.pdf");

    pw.Document pdf = pw.Document();
    pdf.addPage(_createPage(
        examAttemptStatisticsInofrmation: examAttemptStatisticsInofrmation));

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

/*
                    CustomCardExamResult(
                      numberCorrectAnswer: controller
                          .examAttemptStatisticsInofrmation.numberCorrectAnswer
                          .toString(),
                      numberWrongAnswer: controller
                          .examAttemptStatisticsInofrmation.numberWrongAnswer
                          .toString(),
                      totalQuestions: controller
                          .examAttemptStatisticsInofrmation.totalQuestions
                          .toString(),
                    ),

*/

  static pw.Page _createPage(
      {required ExamAttemptModel examAttemptStatisticsInofrmation}) {
    return pw.Page(

        //  textDirection: TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Center(child: pw.Text('Mohamed'));

          // return pw.CustomCardExamResult(
          //   numberCorrectAnswer: '',
          //   numberWrongAnswer: '',
          //   totalQuestions: '',
          // );
        });
  }

// buildCard() => pw.Container(
//       width: 305.w,
//       height: 250.h,
//       alignment: pw.Alignment.center,
//       decoration: pw.BoxDecoration(boxShadow: const <BoxShadow>[
//       pw.  BoxShadow(
//             offset: Offset(0, 4),
//             spreadRadius: 0,
//             blurRadius: 4,
//             color: Color.fromRGBO(0, 0, 0, 0.50)),
//       ], borderRadius: BorderRadius.circular(30).r, color: Colors.white),
//       child: pw.Row(
//         mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
//         children: [
//           pw.Column(
//             mainAxisSize: pw.MainAxisSize.min,
//             crossAxisAlignment: pw.CrossAxisAlignment.end,
//             children: [
//               pw.CustomStatisticsText(
//                 text: 'مجموع الاسئلة',
//                 numbertext: '15',
//                 color: const Color(0xff4996BF),
//               ),
//               pw.30.verticalSpace,
//               CustomStatisticsText(
//                 text: 'اجابة خاطئة',
//                 numbertext: '5',
//                 color: const Color(0xffFA3939),
//               ),
//             ],
//           ),
//           pw.Column(
//             mainAxisSize: pw.MainAxisSize.min,
//             crossAxisAlignment: pw.CrossAxisAlignment.end,
//             children: [
//               const pw.CustomStatisticsText(
//                 text: 'اكتمل الاختبار',
//                 numbertext: "100%",
//                 color: Color(0xff4996BF),
//               ),
//               30.verticalSpace,
//               CustomStatisticsText(
//                 text: 'اجابة صحيحة',
//                 numbertext: '10',
//                 color: const Color(0xff2FD21C),
//               ),
//             ],
//           )
//         ],
//       ),
//     );

// buildCustomText({
//       required String text,

// }){
// return pw.Text(text,

//           style: pw.TextStyle(
//               //              fontFamily: "DMSans",
//               // fontWeight: pw.FontWeight.w500,
//               color: PdfColor(0, 0, 0),
//               fontSize: 20.sp));
// }
//     buildCustomStatiticsText(){
// return pw.  Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.end,
//       children: [
//         pw.Row(
//           children: [
//            pw. CustomText(
//               text: 'ds',
//               fontFamily: "DMSans",
//               fontWeight: FontWeight.w500,
//               color: PdfColor(0, 0, 0),
//               fontSize: 20.sp,
//             ),
//             // 5.horizontalSpace,
//             pw.SizedBox(height: 5),
//             pw.Container(
//               width: 12.r,
//               height: 12.r,
//               decoration: pw.BoxDecoration(
//                 shape: pw.BoxShape.circle,
//                  color: PdfColor(0, 0, 0),
//               ),
//             ),
//           ],
//         ),
//         CustomText(
//           text: '',
//           fontFamily: "DMSans",
//           fontWeight: pw.FontWeight.w400,
//           fontSize: 16.sp,
//         )
//       ],
//     );
//     }
  static createImg(String path) {
    PdfConverter.convertToImage(path);
  }
}
