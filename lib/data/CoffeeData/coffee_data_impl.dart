import 'dart:convert';

import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/data/CoffeeData/coffee_data.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Models/coffee_model.dart';

final coffeeDataProvider =
    Provider<CoffeeData>((ref) => CoffeeDataImpl(ref: ref));

class CoffeeDataImpl implements CoffeeData {
  final Ref _ref;

  CoffeeDataImpl({required Ref ref}) : _ref = ref;

  @override
  Future<Either<String, List<CoffeeModel>>> getCoffees() async {
    try {
      final coffeeDatas = await _getCoffees('coffee_data');
      return Right(coffeeDatas);
    } on FirebaseException catch (e) {
      return left(e.message ?? "something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, List<String>>> getCategories() async {
    try {
      final reference = _ref.read(firebaseDatabaseProvider).ref('categories');
      final firebaseCoffeeCategories = await reference.get();
      final categories = <String>[];

      final encodedValue = jsonEncode(firebaseCoffeeCategories.value);

      for (var element in jsonDecode(encodedValue)) {
        categories.add(element);
      }

      return Right(categories);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CoffeeModel>>> getSpecialData() async {
    final userId = _ref.read(firebaseAuthProvider).currentUser?.uid;
    if (userId == null) {
      return const Left("UnAuthorized");
    }
    final coffeeDatas = await _getCoffees('special_coffee_data');
    try {
      return Right(coffeeDatas);
    } on FirebaseException catch (e) {
      return Left(e.message ?? "something went wrong , please try again later");
    }
  }

  Future<List<CoffeeModel>> _getCoffees(String path) async {
    try {
      final reference = _ref.read(firebaseDatabaseProvider).ref(path);
      final firebaseData = await reference.get();
      final coffeeDatas = <CoffeeModel>[];

      final encodedValue = jsonEncode(firebaseData.value);

      for (var element in jsonDecode(encodedValue)) {
        coffeeDatas.add(CoffeeModel.fromJson(element));
      }
      return coffeeDatas;
    } catch (e) {
      rethrow;
    }
  }
}
