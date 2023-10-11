import 'dart:convert';

import 'package:coffee_shop/Models/orders_model.dart';
import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/data/OrdersData/orders_data.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ordersDataProvider =
    Provider<OrdersData>((ref) => OrdersDataImpl(ref: ref));

class OrdersDataImpl implements OrdersData {
  final Ref _ref;

  OrdersDataImpl({required Ref ref}) : _ref = ref;
  @override
  Future<Either<String, List<OrdersModel>>> getMyOrders() async {
    // db reference
    final dbReference = _ref.read(firebaseDatabaseProvider).ref('orders');
    // fetch the user id
    final uid = _ref.read(firebaseAuthProvider).currentUser?.uid;
    // if the user is null it may get all the orders available in it
    if (uid == null) {
      return const Left("UnAuthorized");
    }
    try {
      // fetch the orders using uid;
      final result = await dbReference.child(uid).get();
      final ordersList = <OrdersModel>[];
      // encode the result

      final encodedResult = jsonEncode(result.value);
      final decodedResult = jsonDecode(encodedResult) as Map;

      final purifiedDataList =
          decodedResult.entries.map((e) => e.value).toList();

      //
      for (var element in purifiedDataList) {
        ordersList.add(OrdersModel.fromJson(element[0]));
      }
      return Right(ordersList);
    } on FirebaseException catch (e) {
      return Left(e.message ?? "something went wrong");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> orderCoffee(OrdersModel orderModel) async {
    final dbReference = _ref.read(firebaseDatabaseProvider).ref('orders');
    final uid = _ref.read(firebaseAuthProvider).currentUser?.uid;
    if (uid == null) {
      return const Left("UnAuthorized");
    }
    try {
      await dbReference.child(uid).push().set([orderModel.toJson()]);

      return const Right("sucessful");
    } on FirebaseException catch (e) {
      return Left(e.message ?? "something went wrong");
    }
  }
}
