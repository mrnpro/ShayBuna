import 'dart:convert';

import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/core/providers/general_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final specialDataProvider =
    Provider<SpecialData>((ref) => SpecialDataImpl(ref: ref));

abstract class SpecialData {
  Future<Either<String, List<CoffeeModel>>> getSpecialData();
}

class SpecialDataImpl implements SpecialData {
  final Ref _ref;

  SpecialDataImpl({required Ref ref}) : _ref = ref;
  @override
  Future<Either<String, List<CoffeeModel>>> getSpecialData() async {
    final userId = _ref.read(firebaseAuthProvider).currentUser?.uid;
    if (userId == null) {
      return const Left("UnAuthorized");
    }
    final reference =
        _ref.read(firebaseDatabaseProvider).ref('special_data').child(userId);

    try {
      final firebaseData = await reference.get();
      final specialDatas = <CoffeeModel>[];

      final endocdedData = jsonEncode(firebaseData.value);
      for (var element in jsonDecode(endocdedData)) {
        specialDatas.add(CoffeeModel.fromJson(element));
      }
      return Right(specialDatas);
    } on FirebaseException catch (e) {
      return Left(e.message ?? "something went wrong , please try again later");
    }
  }
}
