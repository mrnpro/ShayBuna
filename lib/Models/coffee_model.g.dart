// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeModelImpl _$$CoffeeModelImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeModelImpl(
      pid: json['pid'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      hasMilk: json['hasMilk'] as bool,
      discountText: json['discountText'] as String?,
      hasDiscount: json['hasDiscount'] as bool?,
    );

Map<String, dynamic> _$$CoffeeModelImplToJson(_$CoffeeModelImpl instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'hasMilk': instance.hasMilk,
      'discountText': instance.discountText,
      'hasDiscount': instance.hasDiscount,
    };
