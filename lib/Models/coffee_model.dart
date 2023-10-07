import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'coffee_model.freezed.dart';
part 'coffee_model.g.dart';

@freezed
class CoffeeModel with _$CoffeeModel {
  const factory CoffeeModel({
    required String title,
    required String price,
    required String category,
    required String description,
    required String imagePath,
    required bool hasMilk,
    String? discount,
    bool? hasDiscount,
  }) = _CoffeeModel;
  factory CoffeeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeModelFromJson(json);
}
