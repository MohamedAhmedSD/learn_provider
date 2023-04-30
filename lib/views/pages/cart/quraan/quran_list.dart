import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quran_bank.dart';
import 'quran_model.dart';

class QuranListWidget extends StatelessWidget {
  QuranListWidget({super.key});
  TextEditingController quranPageNumber = TextEditingController();
  TextEditingController quranSourahName = TextEditingController();
  TextEditingController quranayahNumber = TextEditingController();
  final List<Quran> _myQuran = [
    Quran(quranPageNumber: 0, quranSourahName: 'الفاتحه', quranayahNumber: 1),
    Quran(quranPageNumber: 1, quranSourahName: 'الفاتحه', quranayahNumber: 2),
    Quran(quranPageNumber: 1, quranSourahName: 'الفاتحه', quranayahNumber: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QuranBank(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              child: Consumer<QuranBank>(
                builder: (context, quran, child) => ListTile(
                  //* certain name field
                  title: Text(_myQuran[0].quranSourahName),
                  trailing: Text("${_myQuran[0].quranPageNumber}"),
                  subtitle: Text("${_myQuran[0].quranayahNumber}"),
                  // title: TextFormField(
                  //   controller: quranSourahName,
                  //   decoration:
                  //       const InputDecoration(hintText: "quranSourahName"),
                  // ),
                  // subtitle: TextFormField(
                  //   controller: quranayahNumber,
                  //   decoration:
                  //       const InputDecoration(hintText: "quranayahNumber"),
                  // ),
                  // trailing: TextFormField(
                  //   controller: quranPageNumber,
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<QuranBank>(
            builder: (context, quran, child) => ElevatedButton(
              onPressed: () {
                quran.add(_myQuran[0]);
                print(quran.count);
                print(quran.quranFollow);
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
