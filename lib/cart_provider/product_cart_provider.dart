

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCartProvider with ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  double _totalProductPrice = 0.0;
  double get totalProductPrice => _totalProductPrice;

  void _setPrefItems()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cart_item', _counter);
    preferences.setDouble('total_price', _totalProductPrice);
    notifyListeners();
  }

  void _getPrefItems()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('cart_item') ?? 0;
    _totalProductPrice = preferences.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter(){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter(){
    _getPrefItems();
    return _counter;
  }



  void addTotalProductPrice(double productPrice){
    _totalProductPrice += productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalProductPrice(double productPrice){
    _totalProductPrice= _totalProductPrice-productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalProductPrice(){
    _getPrefItems();
    return _totalProductPrice;
  }

}