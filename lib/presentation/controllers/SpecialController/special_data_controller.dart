import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/data/CoffeeData/coffee_data_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final specialDataStateNotifierProvider =
    StateNotifierProvider<SpecialDataController, AsyncValue<List<CoffeeModel>>>(
        (ref) => SpecialDataController(ref: ref)..fetchSpecials());

class SpecialDataController
    extends StateNotifier<AsyncValue<List<CoffeeModel>>> {
  final Ref _ref;

  SpecialDataController({required Ref ref})
      : _ref = ref,
        super(const AsyncLoading());
  void fetchSpecials() async {
    state = const AsyncValue.loading();
    final response = await _ref.read(coffeeDataProvider).getSpecialData();
    state = response.fold(
        (error) => AsyncError(error, StackTrace.current), (r) => AsyncData(r));
  }
}
