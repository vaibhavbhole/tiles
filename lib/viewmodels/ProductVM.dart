import 'package:flutter/material.dart';
import 'package:tiles/models/Product.dart';
import 'package:tiles/repositories/UserRepository.dart';

class ProductVm extends ChangeNotifier{
  final UserRepository _repository=UserRepository();
  List<Product>? _list;
  List<Product>? get list=> _list;

  void fetchProducts() async{
    _list= await _repository.getProducts(1, 10);
    notifyListeners();
  }
}