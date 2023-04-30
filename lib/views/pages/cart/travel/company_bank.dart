import 'package:flutter/material.dart';
import 'package:learn_provider/views/pages/cart/travel/company_model.dart';

class CompanyBank extends ChangeNotifier {
  final List<Company> _company = [];

  void add(Company company) {
    _company.add(company);
    notifyListeners();
  }

  void remove(Company company) {
    _company.remove(company);
    notifyListeners();
  }

  //? use getter to get final list and may to get final number of items inside a list
  int get count => _company.length;
  List<Company> get companyList => _company;
}
