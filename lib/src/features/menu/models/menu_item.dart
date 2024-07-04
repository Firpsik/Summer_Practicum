class MenuItem {
  final String name;
  final int price;
  final String? imagePath;

  const MenuItem({
    required this.name,
    required this.price,
    this.imagePath,
  });

  factory MenuItem.fromJSON(Map<String, dynamic> json) {
    return MenuItem(
      imagePath: json['imagePath'],
      name: json['name'],
      price: json['price'],
    );
  }
}