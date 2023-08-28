class CategoryItem {
  final String id;
  final String assetImgPath;
  final String name;

  CategoryItem({
    required this.id,
    required this.assetImgPath,
    required this.name,
  });
}

List<CategoryItem> category = [
  CategoryItem(
      id: '1', assetImgPath: 'assets/images/burger.png', name: 'Burger'),
  CategoryItem(id: '2', assetImgPath: 'assets/images/pizza.png', name: 'Pizza'),
  CategoryItem(id: '3', assetImgPath: 'assets/images/pasta.png', name: 'Pasta'),
  CategoryItem(id: '4', assetImgPath: 'assets/images/drink.png', name: 'Drink'),
  CategoryItem(id: '5', assetImgPath: 'assets/images/taco.png', name: 'Taco'),
];
