class Category {
  final String name, image;
  Category({required this.name, required this.image});
}

List<Category> category = [
  Category(name: "Women", image: "assets/women.png"),
  Category(name: "Men", image: "assets/man.png"),
  Category(name: "Teens", image: "assets/teens.png"),
  Category(name: "Kids", image: "assets/kid.png"),
  Category(name: "Baby", image: "assets/baby.png"),
];

List<String> filterCategory = [
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
