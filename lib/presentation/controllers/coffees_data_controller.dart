import 'package:flutter/foundation.dart';
import '../../data/CoffeeData/coffee_data.dart';
import '../../data/CoffeeData/coffee_model.dart';

class CoffeeDataController extends ChangeNotifier {
  final CoffeeData _coffeeData;
  List<CoffeeModel> _coffees = [];
  final List<String> _coffeeCategories = ["All"];
  int _selectedCategoryIndex = 0;

  // returns the categories from the data-----
  List<String> get allCategories => _coffeeCategories;

  // returns the coffees
  List<CoffeeModel> get coffeeData => _coffees;

  CoffeeDataController(this._coffeeData);

  int get getSelectedCategoryIndex => _selectedCategoryIndex;
  void changeCurrentCategoryIndex({int? currentIndex}) {
    _selectedCategoryIndex = currentIndex ?? 0;
    notifyListeners();
  }

  // fetch the data with the category provided on the parameter
  void fetchData({String? categoryName}) {
    final allCoffees = _coffeeData.getCoffees;

    if (categoryName == null || categoryName == "All") {
      _coffees = allCoffees;

      notifyListeners();
      return;
    }

    final filteredCoffees = _filterWithCategory(categoryName, allCoffees);
    _coffees = filteredCoffees;
    notifyListeners();
  }

  // extracts all the categories from the coffee data
  void fetchAllCategories() {
    final allCoffees = _coffeeData.getCoffees;

    for (var coffeeElement in allCoffees) {
      // lets check if the category is already in category list or not
      bool isExist = _coffeeCategories.contains(coffeeElement.category);
      if (!isExist) {
        _coffeeCategories.add(coffeeElement.category);
      }
    }
    notifyListeners();
  }

  List<CoffeeModel> _filterWithCategory(String categoryName, allCoffees) {
    return allCoffees
        .where(
          (element) => element.category == categoryName,
        )
        .toList();
  }
}
