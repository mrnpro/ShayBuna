import 'package:coffee_shop/data/CoffeeData/coffee_data.dart';
import 'package:coffee_shop/data/CoffeeData/coffee_data_impl.dart';
import 'package:coffee_shop/presentation/controllers/CoffeeController/coffee_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/Models/coffee_model.dart';

final coffeeNotifierProvider =
    StateNotifierProvider<CoffeeController, CoffeeState>(
        (ref) => CoffeeController(ref: ref)..fetchCoffee());

class CoffeeController extends StateNotifier<CoffeeState> {
  final Ref _ref;

  CoffeeController({required Ref ref})
      : _ref = ref,
        super(CoffeeState.initial());
  void fetchCoffee({String category = 'All'}) async {
    state = CoffeeState.loading();
    // check if the category is ALL , then return all the datas fetched from the server
    if (category == "All") {
      final response = await _ref.read(coffeeDataProvider).getCoffees();
      state = response.fold((error) => CoffeeState.error(error), (data) {
        return CoffeeState.loaded(
          coffees: data,
        );
      });
      return;
    }

    final response = await _ref.read(coffeeDataProvider).getCoffees();
    state = response.fold((error) => CoffeeState.error(error), (data) {
      final filteredData = _filterWithCategory(category, data);

      return CoffeeState.loaded(coffees: filteredData);
    });
  }

  List<CoffeeModel> _filterWithCategory(
      String categoryName, List<CoffeeModel> allCoffees) {
    return allCoffees
        .where(
          (element) => element.category == categoryName,
        )
        .toList();
  }
}
