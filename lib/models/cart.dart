import 'package:flutter/material.dart';

import 'item.dart';

//* MY Model
class Cart extends ChangeNotifier {
  //! we use empty list add items on it then clac there number && total price
  final List<MyItem> _items = []; //* to add items here
  double _price = 0.0; //* total price

  //* add item
  void add(MyItem item) {
    _items.add(item);
    _price += item.price; //* look how we add prices
    notifyListeners(); //* don't forget it
  }

  //* remove item
  void remove(MyItem item) {
    _items.remove(item);
    _price -= item.price; //* look how we remove prices
    notifyListeners(); //* don't forget it
  }

  //! use getter => clac there number && total price
  //? if not write return => causing null to be returend => just add return
  int get count {
    return _items.length;
    //* we don't use => notifyListeners()
  }

  double get totalPrice {
    return _price;
  }

  //! we need make a list to display items that add into basket
  //* by using get to bring our list => _items
  List<MyItem> get basketitem {
    return _items; //? look at here
  }
}
