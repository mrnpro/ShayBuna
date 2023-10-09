import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../Models/orders_model.dart';

part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.ordersFetched({required List<OrdersModel> orders}) =
      _OrdersFetched;
  const factory OrdersState.orderPlaced() = _OrderPlaced;
  const factory OrdersState.error({String? error}) = _Error;
}
