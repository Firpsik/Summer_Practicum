import 'package:summer_practicum/src/features/menu/models/menu_category.dart';
import 'package:summer_practicum/src/features/menu/models/menu_item.dart';

const categories = [
  MenuCategory(
    categoryName: 'Чёрный кофе',
    items: [
      MenuItem(name: 'Американо', price: 99),
      MenuItem(name: 'Эспрессо', price: 99),
    ],
  ),
  MenuCategory(
    categoryName: 'Кофе с молоком',
    items: [
      MenuItem(name: 'Капучино', price: 129),
      MenuItem(name: 'Латте', price: 129),
      MenuItem(name: 'XXL', price: 179),
    ],
  ),
  MenuCategory(
    categoryName: 'Чай',
    items: [
      MenuItem(name: 'Curtis', price: 79),
      MenuItem(name: 'IceTea', price: 99),
      MenuItem(name: 'Puer', price: 149),
    ],
  ),
];