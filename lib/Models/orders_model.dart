import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_model.g.dart';
part 'orders_model.freezed.dart';

@freezed
class OrdersModel with _$OrdersModel {
  factory OrdersModel(
      {String? uid,
      String? pid,
      String? coffeeSize,
      String? price,
      String? deliveryStatus,
      String? txRef}) = _CoffeeModel;
  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}
