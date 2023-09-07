import 'coffee_data.dart';
import 'coffee_model.dart';

class MockDatas implements CoffeeData {
// those are dummy datas
  final List<CoffeeModel> _coffeeDatas = [
    CoffeeModel(
      title: "Espresso",
      price: "2.99",
      category: "Hot Drinks",
      description: "A strong and concentrated coffee served in a small cup.",
      imagePath: "assets/espresso.jpg",
      hasMilk: false,
    ),
    CoffeeModel(
      title: "Cappuccino",
      price: "3.49",
      category: "Hot Drinks",
      description:
          "Espresso with steamed milk and a layer of frothy milk foam.",
      imagePath: "assets/cappuccino.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Latte",
      price: "3.99",
      category: "Hot Drinks",
      description: "Espresso with a generous amount of steamed milk.",
      imagePath: "assets/latte.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Black Coffee",
      price: "2.49",
      category: "Cold Drinks",
      description: "Simple black coffee without any additives.",
      imagePath: "assets/black_coffee.jpg",
      hasMilk: false,
    ),
    CoffeeModel(
      title: "Mocha",
      price: "4.29",
      category: "Hot Drinks",
      description: "Espresso with steamed milk, chocolate, and whipped cream.",
      imagePath: "assets/mocha.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Iced Coffee",
      price: "3.99",
      category: "Cold Drinks",
      description: "Chilled coffee served over ice cubes.",
      imagePath: "assets/iced_coffee.jpg",
      hasMilk: false,
    ),
    CoffeeModel(
      title: "Caramel Macchiato",
      price: "4.49",
      category: "Hot Drinks",
      description: "Espresso with caramel and steamed milk.",
      imagePath: "assets/caramel_macchiato.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Iced Mocha",
      price: "4.99",
      category: "Specialty Coffee",
      description: "Chilled coffee with chocolate and whipped cream.",
      imagePath: "assets/iced_mocha.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Chai Latte",
      price: "3.79",
      category: "Specialty Coffee",
      description: "Spiced tea with steamed milk.",
      imagePath: "assets/chai_latte.jpg",
      hasMilk: true,
    ),
    CoffeeModel(
      title: "Iced Tea",
      price: "2.79",
      category: "Specialty Coffee",
      description: "Chilled tea served over ice cubes.",
      imagePath: "assets/iced_tea.jpg",
      hasMilk: false,
    ),
  ];

  @override
  List<CoffeeModel> get getCoffees => _coffeeDatas;
}