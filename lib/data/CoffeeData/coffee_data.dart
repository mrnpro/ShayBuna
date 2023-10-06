import 'package:dartz/dartz.dart';

import '../Models/coffee_model.dart';

abstract class CoffeeData {
  Future<Either<String, List<CoffeeModel>>> getCoffees();
  Future<Either<String, List<String>>> getCategories();
}
