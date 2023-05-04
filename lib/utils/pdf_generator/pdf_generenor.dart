import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


Future<Uint8List> buildPdf({
  required DateTime selectedMonth,
  required List stats,
}) async {
  final regularData = await rootBundle.load("assets/fonts/Inter-Regular.ttf");
  final mediumData = await rootBundle.load("assets/fonts/Inter-Medium.ttf");
  final regular = pw.Font.ttf(regularData);
  final medium = pw.Font.ttf(mediumData);
  final pw.Document doc = pw.Document();
  final table = pw.Table.fromTextArray(
    border: null,
    headers: ['Category', 'Transactions', 'Expenses', 'Result'],
    data: List<List<dynamic>>.generate(
      stats.length,
      (index) => <dynamic>[
        stats[index].title,
        stats[index].counterTransactions,
        stats[index].totalAmount,
        '${stats[index].percentage.round()}%',
      ],
    ),
    headerStyle: pw.TextStyle(
      color: PdfColors.white,
      fontWeight: pw.FontWeight.bold,
    ),
    headerDecoration: const pw.BoxDecoration(
      borderRadius: pw.BorderRadius.vertical(top: pw.Radius.circular(8)),
      color: PdfColor.fromInt(0xff007BEF),
    ),
    rowDecoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(
          color: PdfColor.fromInt(0xff616161),
          width: 0.5,
        ),
      ),
    ),
    cellAlignment: pw.Alignment.centerRight,
    cellAlignments: {0: pw.Alignment.centerLeft},
  );

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          // pw.Image(image),
          pw.Flexible(
            child: pw.Chart(
              title: pw.Text(
                  'Expense report on ${DateFormat(DateFormat.MONTH).format(selectedMonth)}, '
                  '${selectedMonth.year}',
                  style: pw.TextStyle(
                      color: const PdfColor.fromInt(0xff212121),
                      font: medium,
                      fontSize: 18)),
              grid: pw.PieGrid(),
              datasets: List.generate(
                stats.length,
                (index) {
                  return pw.PieDataSet(
                      legend: '${stats[index].title} '
                          '${stats[index].percentage.round()}%',
                      legendPosition: pw.PieLegendPosition.outside,
                      legendStyle: pw.TextStyle(
                          font: medium,
                          fontSize: 12,
                          color: const PdfColor.fromInt(0xff212121)),
                      value: (stats[index].percentage).round(),
                      color: PdfColor.fromHex(stats[index].icon.color));
                },
              ),
            ),
          ),
          pw.SizedBox(
            height: 8,
          ),
          pw.Center(
            child: pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 16),
              child: pw.Text(
                'DETAILS',
                style: pw.TextStyle(
                    color: const PdfColor.fromInt(
                      0xff212121,
                    ),
                    font: regular,
                    fontSize: 12),
              ),
            ),
          ),
          table
        ]);
      },
    ),
  );
  return doc.save();
}

Future<void> createOpenPdf(
    {required List statistics, required DateTime reportDate}) async {
  final data = await buildPdf(
    selectedMonth: reportDate,
    stats: statistics,
  );
  final path = await savePdfFile(
      fileName: 'Expense_report${reportDate.year}', byteList: data);

  await OpenFilex.open(path);
}

Future<String> savePdfFile(
    {required String fileName, required Uint8List byteList}) async {
  final output = await getTemporaryDirectory();
  final path =
      '${output.path}/${fileName}_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final file = File(path);
  return await file.writeAsBytes(byteList).then((value) => value.path);
}
