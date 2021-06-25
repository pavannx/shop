import 'package:flutter/cupertino.dart';
import './cart.dart';

class OrderItem {
  @required
  final String id;
  @required
  final double amount;
  @required
  final List<CartItem> products;
  @required
  final DateTime dateTime;

  OrderItem({this.id, this.amount, this.dateTime, this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts,
        ));
    notifyListeners();
  }
}
