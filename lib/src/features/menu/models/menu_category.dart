import 'package:summer_practicum/src/features/menu/models/menu_item.dart';

class MenuCategory {
  final String categoryName;
  final List<MenuItem> items;

  const MenuCategory({
    required this.categoryName,
    required this.items,
  });

  factory MenuCategory.fromJSON(Map<String, dynamic> json) {
    return MenuCategory(
      categoryName: json['categoryName'],
      items: json['items'],
    );
  }
}