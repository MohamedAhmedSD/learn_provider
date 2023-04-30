import 'package:flutter/material.dart';
import 'package:learn_provider/views/pages/cart/quraan/quran_list.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuranListWidget());
  }
}
