import 'package:coffee_shop/Models/orders_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersData {
  Future<Either<String, List<OrdersModel>>> getMyOrders();
  Future<Either<String, String>> orderCoffee(OrdersModel coffees);
}
