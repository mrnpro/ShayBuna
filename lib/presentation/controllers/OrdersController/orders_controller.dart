import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:coffee_shop/Models/orders_model.dart';
import 'package:coffee_shop/data/OrdersData/orders_data_impl.dart';
import 'package:coffee_shop/presentation/controllers/OrdersController/orders_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ordersStateNotifierProvider =
    StateNotifierProvider.autoDispose<OrdersController, OrdersState>(
        (ref) => OrdersController(ref: ref));

class OrdersController extends StateNotifier<OrdersState> {
  final Ref _ref;
  OrdersController({required Ref ref})
      : _ref = ref,
        super(const OrdersState.initial());

  Future<void> getOrders() async {
    state = const OrdersState.loading();
    // fetch the orders data

    final result = await _ref.read(ordersDataProvider).getMyOrders();
    if (!mounted) {
      return;
    }

    state = result.fold((error) => OrdersState.error(error: error),
        (data) => OrdersState.ordersFetched(orders: data));
  }

  void placeOrder(
      {required BuildContext context,
      required String pid,
      required String price,
      required String coffeeSize}) async {
    //generate tx-ref
    final txRef = TxRefRandomGenerator.generate(prefix: 'shay-buna');
    try {
      state = const OrdersState.loading();
      // start the payment process
      await Chapa.getInstance.startPayment(
        context: context,
        onInAppPaymentSuccess: (successMsg) async {
          // place order on server
          final response = await _ref.read(ordersDataProvider).orderCoffee(
              OrdersModel(
                  pid: pid,
                  txRef: txRef,
                  deliveryStatus: "pending",
                  coffeeSize: coffeeSize,
                  price: price));
          state = response.fold((error) => OrdersState.error(error: error),
              (success) => const OrdersState.orderPlaced());
        },
        onInAppPaymentError: (errorMsg) {
          state = OrdersState.error(error: errorMsg);
        },
        amount: price,
        currency: 'ETB',
        txRef: txRef,
      );
    } on ChapaException catch (e) {
      if (e is AuthException) {
      } else if (e is InitializationException) {
        state = OrdersState.error(error: e.msg);
      } else if (e is NetworkException) {
        state = OrdersState.error(error: e.msg);
      } else if (e is ServerException) {
        state = OrdersState.error(error: e.msg);
      } else {
        state = const OrdersState.error(error: "something went wrong");
      }
    }
  }
}
