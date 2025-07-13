class Category {
  final String name, image;

  Category({required this.name, required this.image});
}

final List<Category> categories = [
  Category(
    name: "Women",
    image: "assets/women.png",
  ),
  Category(
    name: "Men",
    image: "assets/man.webp",
  ),
  Category(
    name: "Teens",
    image: "assets/teen.jpg",
  ),
  Category(
    name: "Kids",
    image: "assets/kids.png",
  ),
  Category(
    name: "Baby",
    image: "assets/baby.jpeg",
  ),
];
List<String> fCategory = [
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
