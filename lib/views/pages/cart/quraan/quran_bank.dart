import 'package:flutter/material.dart';
import 'package:learn_provider/views/pages/cart/quraan/quran_model.dart';

class QuranBank extends ChangeNotifier {
  final List<Quran> _quran = [];

  void add(Quran quran) {
    _quran.add(quran);
    notifyListeners();
  }

  void remove(Quran quran) {
    _quran.remove(quran);
    notifyListeners();
  }

  //? use getter to get final list and may to get final number of items inside a list
  List<Quran> get quranFollow => _quran;
  int get count => _quran.length;
}
