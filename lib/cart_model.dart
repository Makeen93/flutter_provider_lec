import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<String> list = [];
  get() {
    return list;
  }

  void addToList(String item) {
    list.add(item);
    notifyListeners();
  }

  void removeFromList(String item) {
    list.remove(item);
    notifyListeners();
  }
}
