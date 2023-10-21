import 'package:coffee_shop/data/CoffeeData/coffee_data_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cofeeCategoryNotifier =
    StateNotifierProvider<CofeeCategoryController, AsyncValue<List<String>>>(
        (ref) => CofeeCategoryController(ref: ref)..fetchAllCategories());
final categoryIndexStateProvider = StateProvider<int>((ref) => 0);

class CofeeCategoryController extends StateNotifier<AsyncValue<List<String>>> {
  final Ref _ref;
  int selectedCategoryIndex = 0;
  CofeeCategoryController({required Ref ref})
      : _ref = ref,
        super(const AsyncValue.loading());

  Future<void> fetchAllCategories() async {
    state = const AsyncValue.loading();
    final response = await _ref.read(coffeeDataProvider).getCategories();
    state = response.fold(
        (error) => AsyncValue.error(error, StackTrace.current),
        (data) => AsyncValue.data(["All", ...data]));
  }
}
