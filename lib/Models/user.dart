import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {String? phoneNumber,
      String? uid,
      String? email,
      String? password,
      String? date}) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
