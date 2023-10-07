import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../Models/coffee_model.dart';
part 'coffee_state.freezed.dart';

@freezed
abstract class CoffeeState with _$CoffeeState {
  factory CoffeeState.initial() = _Initial;
  factory CoffeeState.loading() = _Loading;
  factory CoffeeState.loaded({required List<CoffeeModel> coffees}) = _Loaded;
  factory CoffeeState.error(String error) = _Error;
}
