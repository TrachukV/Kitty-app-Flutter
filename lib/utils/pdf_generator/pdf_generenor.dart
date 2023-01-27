import 'dart:io';
import 'dart:typed_data';

import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kitty_app/models/statistics_model/statistics_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:open_document/open_document.dart';

Future<Uint8List> buildPdf({
  required DatabaseState state,
  required int selectedMonth,
  required List<StatisticsModel> statistics,
}) async {
  final pw.Document doc = pw.Document();
  final table = pw.Table.fromTextArray(
    border: null,
    headers: ['Category', 'Transactions', 'Expenses', 'Result'],
    data: List<List<dynamic>>.generate(
      statistics.length,
      (index) => <dynamic>[
        statistics[index].title,
        statistics[index].counterTransactions,
        statistics[index].totalAmount,
        '${statistics[index].percentage.round()}%',
      ],
    ),
    headerStyle: pw.TextStyle(
      color: PdfColors.blueGrey,
      fontWeight: pw.FontWeight.bold,
    ),
    headerDecoration: const pw.BoxDecoration(
      borderRadius: pw.BorderRadius.vertical(top: pw.Radius.circular(50)),
    ),
    rowDecoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(
          color: PdfColor.fromInt(0xffeb4034),
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
          pw.Container(
            decoration: pw.BoxDecoration(borderRadius: pw.BorderRadius.circular(100)
            ),
child: pw.Text('2023 month ${state.activeMonth}'),
          ),
          pw.Center(
            child: pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 16),
              child: pw.Text(
                'EXPENSES',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.blue, fontSize: 12),
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

Future<void> savePdfFile({required String fileName, required Uint8List byteList}) async {
  final output = await getTemporaryDirectory();
  final path = '${output.path}/${fileName}_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final file = File(path);
  await file.writeAsBytes(byteList);
  await OpenDocument.openDocument(filePath: path);
}

Future<void> createOpenPdf(DatabaseState state) async {
  final data = await buildPdf(
    selectedMonth: state.activeMonth,
    statistics: state.statisticsModels, state: state,
  );
  await savePdfFile(fileName: 'Expense_report_by_${state.activeMonth} 2023', byteList: data);
}
