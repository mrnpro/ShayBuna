import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:coffee_shop/data/SpecialData/special_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final specialDataStateNotifierProvider =
    StateNotifierProvider<SpecialDataController, AsyncValue<List<CoffeeModel>>>(
        (ref) => SpecialDataController(ref: ref));

class SpecialDataController
    extends StateNotifier<AsyncValue<List<CoffeeModel>>> {
  final Ref _ref;

  SpecialDataController({required Ref ref})
      : _ref = ref,
        super(const AsyncLoading());
  void fetchSpecials() async {
    final response = await _ref.read(specialDataProvider).getSpecialData();
    state = response.fold(
        (l) => AsyncError(l, StackTrace.current), (r) => AsyncData(r));
  }
}
