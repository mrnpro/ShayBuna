// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _CoffeeModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  String? get uid => throw _privateConstructorUsedError;
  String? get pid => throw _privateConstructorUsedError;
  String? get coffeeSize => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get deliveryStatus => throw _privateConstructorUsedError;
  String? get txRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
          OrdersModel value, $Res Function(OrdersModel) then) =
      _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call(
      {String? uid,
      String? pid,
      String? coffeeSize,
      String? price,
      String? deliveryStatus,
      String? txRef});
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? pid = freezed,
    Object? coffeeSize = freezed,
    Object? price = freezed,
    Object? deliveryStatus = freezed,
    Object? txRef = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      coffeeSize: freezed == coffeeSize
          ? _value.coffeeSize
          : coffeeSize // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      txRef: freezed == txRef
          ? _value.txRef
          : txRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeModelImplCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$CoffeeModelImplCopyWith(
          _$CoffeeModelImpl value, $Res Function(_$CoffeeModelImpl) then) =
      __$$CoffeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? pid,
      String? coffeeSize,
      String? price,
      String? deliveryStatus,
      String? txRef});
}

/// @nodoc
class __$$CoffeeModelImplCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$CoffeeModelImpl>
    implements _$$CoffeeModelImplCopyWith<$Res> {
  __$$CoffeeModelImplCopyWithImpl(
      _$CoffeeModelImpl _value, $Res Function(_$CoffeeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? pid = freezed,
    Object? coffeeSize = freezed,
    Object? price = freezed,
    Object? deliveryStatus = freezed,
    Object? txRef = freezed,
  }) {
    return _then(_$CoffeeModelImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      coffeeSize: freezed == coffeeSize
          ? _value.coffeeSize
          : coffeeSize // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      txRef: freezed == txRef
          ? _value.txRef
          : txRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeModelImpl implements _CoffeeModel {
  _$CoffeeModelImpl(
      {this.uid,
      this.pid,
      this.coffeeSize,
      this.price,
      this.deliveryStatus,
      this.txRef});

  factory _$CoffeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeModelImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? pid;
  @override
  final String? coffeeSize;
  @override
  final String? price;
  @override
  final String? deliveryStatus;
  @override
  final String? txRef;

  @override
  String toString() {
    return 'OrdersModel(uid: $uid, pid: $pid, coffeeSize: $coffeeSize, price: $price, deliveryStatus: $deliveryStatus, txRef: $txRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.coffeeSize, coffeeSize) ||
                other.coffeeSize == coffeeSize) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.txRef, txRef) || other.txRef == txRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, pid, coffeeSize, price, deliveryStatus, txRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeModelImplCopyWith<_$CoffeeModelImpl> get copyWith =>
      __$$CoffeeModelImplCopyWithImpl<_$CoffeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeModelImplToJson(
      this,
    );
  }
}

abstract class _CoffeeModel implements OrdersModel {
  factory _CoffeeModel(
      {final String? uid,
      final String? pid,
      final String? coffeeSize,
      final String? price,
      final String? deliveryStatus,
      final String? txRef}) = _$CoffeeModelImpl;

  factory _CoffeeModel.fromJson(Map<String, dynamic> json) =
      _$CoffeeModelImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get pid;
  @override
  String? get coffeeSize;
  @override
  String? get price;
  @override
  String? get deliveryStatus;
  @override
  String? get txRef;
  @override
  @JsonKey(ignore: true)
  _$$CoffeeModelImplCopyWith<_$CoffeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
