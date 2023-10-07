import 'dart:convert';

import 'package:coffee_shop/core/providers/general_providers.dart';
import 'package:coffee_shop/data/CoffeeData/coffee_data.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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
      final reference = _ref.read(firebaseDatabaseProvider).ref();

      final firebaseCoffeeDatas = await reference.child('coffee_data').get();
      final coffeeDatas = <CoffeeModel>[];

      final encodedValue = jsonEncode(firebaseCoffeeDatas.value);

      for (var element in jsonDecode(encodedValue)) {
        coffeeDatas.add(CoffeeModel.fromJson(element));
      }

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
}
