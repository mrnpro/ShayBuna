// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) {
  return _CoffeeModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeeModel {
  String get title => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  bool get hasMilk => throw _privateConstructorUsedError;
  String? get discountText => throw _privateConstructorUsedError;
  bool? get hasDiscount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeModelCopyWith<CoffeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeModelCopyWith<$Res> {
  factory $CoffeeModelCopyWith(
          CoffeeModel value, $Res Function(CoffeeModel) then) =
      _$CoffeeModelCopyWithImpl<$Res, CoffeeModel>;
  @useResult
  $Res call(
      {String title,
      String price,
      String category,
      String description,
      String imagePath,
      bool hasMilk,
      String? discountText,
      bool? hasDiscount});
}

/// @nodoc
class _$CoffeeModelCopyWithImpl<$Res, $Val extends CoffeeModel>
    implements $CoffeeModelCopyWith<$Res> {
  _$CoffeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? category = null,
    Object? description = null,
    Object? imagePath = null,
    Object? hasMilk = null,
    Object? discountText = freezed,
    Object? hasDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      hasMilk: null == hasMilk
          ? _value.hasMilk
          : hasMilk // ignore: cast_nullable_to_non_nullable
              as bool,
      discountText: freezed == discountText
          ? _value.discountText
          : discountText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDiscount: freezed == hasDiscount
          ? _value.hasDiscount
          : hasDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeModelImplCopyWith<$Res>
    implements $CoffeeModelCopyWith<$Res> {
  factory _$$CoffeeModelImplCopyWith(
          _$CoffeeModelImpl value, $Res Function(_$CoffeeModelImpl) then) =
      __$$CoffeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String price,
      String category,
      String description,
      String imagePath,
      bool hasMilk,
      String? discountText,
      bool? hasDiscount});
}

/// @nodoc
class __$$CoffeeModelImplCopyWithImpl<$Res>
    extends _$CoffeeModelCopyWithImpl<$Res, _$CoffeeModelImpl>
    implements _$$CoffeeModelImplCopyWith<$Res> {
  __$$CoffeeModelImplCopyWithImpl(
      _$CoffeeModelImpl _value, $Res Function(_$CoffeeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? category = null,
    Object? description = null,
    Object? imagePath = null,
    Object? hasMilk = null,
    Object? discountText = freezed,
    Object? hasDiscount = freezed,
  }) {
    return _then(_$CoffeeModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      hasMilk: null == hasMilk
          ? _value.hasMilk
          : hasMilk // ignore: cast_nullable_to_non_nullable
              as bool,
      discountText: freezed == discountText
          ? _value.discountText
          : discountText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDiscount: freezed == hasDiscount
          ? _value.hasDiscount
          : hasDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeModelImpl with DiagnosticableTreeMixin implements _CoffeeModel {
  const _$CoffeeModelImpl(
      {required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.imagePath,
      required this.hasMilk,
      this.discountText,
      this.hasDiscount});

  factory _$CoffeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeModelImplFromJson(json);

  @override
  final String title;
  @override
  final String price;
  @override
  final String category;
  @override
  final String description;
  @override
  final String imagePath;
  @override
  final bool hasMilk;
  @override
  final String? discountText;
  @override
  final bool? hasDiscount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoffeeModel(title: $title, price: $price, category: $category, description: $description, imagePath: $imagePath, hasMilk: $hasMilk, discountText: $discountText, hasDiscount: $hasDiscount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoffeeModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('hasMilk', hasMilk))
      ..add(DiagnosticsProperty('discountText', discountText))
      ..add(DiagnosticsProperty('hasDiscount', hasDiscount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.hasMilk, hasMilk) || other.hasMilk == hasMilk) &&
            (identical(other.discountText, discountText) ||
                other.discountText == discountText) &&
            (identical(other.hasDiscount, hasDiscount) ||
                other.hasDiscount == hasDiscount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, price, category,
      description, imagePath, hasMilk, discountText, hasDiscount);

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

abstract class _CoffeeModel implements CoffeeModel {
  const factory _CoffeeModel(
      {required final String title,
      required final String price,
      required final String category,
      required final String description,
      required final String imagePath,
      required final bool hasMilk,
      final String? discountText,
      final bool? hasDiscount}) = _$CoffeeModelImpl;

  factory _CoffeeModel.fromJson(Map<String, dynamic> json) =
      _$CoffeeModelImpl.fromJson;

  @override
  String get title;
  @override
  String get price;
  @override
  String get category;
  @override
  String get description;
  @override
  String get imagePath;
  @override
  bool get hasMilk;
  @override
  String? get discountText;
  @override
  bool? get hasDiscount;
  @override
  @JsonKey(ignore: true)
  _$$CoffeeModelImplCopyWith<_$CoffeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
