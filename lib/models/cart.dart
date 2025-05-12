import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/sections.dart';
import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
class Cart with ChangeNotifier {
  List<Computer> _items = [];
  List<Sections> _itemssection = [];
  double _price = 0.0;
  void add(Computer item) {
    _items.add(item);
    _price += item.price!;
    notifyListeners();
  }

  void addSections(Computer item) {
    _items.add(item);

    _price += item.price;
    notifyListeners();
  }

  void remove(Computer item) {
    _items.remove(item);
    _price -= item.price!;
    notifyListeners();
  }

  void removeSections(Computer item) {
    _items.remove(item);
    _price -= item.price!;
    notifyListeners();
  }

  int get count {
    int c = _items.length;
    int s = _itemssection.length;
    return c + s;
  }

  double get totilprice {
    return _price;
  }

  List<Computer> get backetitem {
    return _items;
  }

  List<Sections> get backetitemsection {
    return _itemssection;
  }
}
