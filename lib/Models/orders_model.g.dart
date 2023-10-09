// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeModelImpl _$$CoffeeModelImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeModelImpl(
      uid: json['uid'] as String?,
      pid: json['pid'] as String?,
      coffeeSize: json['coffeeSize'] as String?,
      price: json['price'] as String?,
      deliveryStatus: json['deliveryStatus'] as String?,
      txRef: json['txRef'] as String?,
    );

Map<String, dynamic> _$$CoffeeModelImplToJson(_$CoffeeModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'pid': instance.pid,
      'coffeeSize': instance.coffeeSize,
      'price': instance.price,
      'deliveryStatus': instance.deliveryStatus,
      'txRef': instance.txRef,
    };
