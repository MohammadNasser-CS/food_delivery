class ProductItem {
  final String id;
  final String name;
  final String imgUrl;
  final String category;
  final double price;

  ProductItem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.category,
    required this.price,
  });
}

List<ProductItem> products = [
  ProductItem(
      id: '1',
      name: 'Checkin Burger',
      imgUrl:
          'https://www.pngplay.com/wp-content/uploads/15/Classic-Chicken-Burger-Transparent-File.png',
      category: 'Burger',
      price: 6.99),
  ProductItem(
      id: '2',
      name: 'Beef Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/023/522/925/original/beef-burger-cutout-free-png.png',
      category: 'Burger',
      price: 9.99),
  ProductItem(
      id: '3',
      name: 'Margherita Pizza',
      imgUrl: 'https://pngimg.com/d/pizza_PNG44074.png',
      category: 'Pizza',
      price: 13.99),
  ProductItem(
      id: '4',
      name: 'Pepperoni Pizza',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/023/742/403/original/pepperoni-pizza-isolated-illustration-ai-generative-free-png.png',
      category: 'Pizza',
      price: 17.99),
  ProductItem(
      id: '5',
      name: 'Chees Pasta',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/021/027/233/original/mac-and-cheese-transparent-background-png.png',
      category: 'Pasta',
      price: 23.99),
  ProductItem(
      id: '6',
      name: 'Checkin Pasta',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/021/217/497/non_2x/pasta-with-roasted-chicken-steak-meat-png.png',
      category: 'Pasta',
      price: 25.99),
  ProductItem(
      id: '7',
      name: 'Coca Cola Drink',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/023/338/744/original/ai-generative-coca-cola-company-fizzy-drinks-diet-coke-pepsi-free-png.png',
      category: 'Drink',
      price: 2.99),
  ProductItem(
      id: '8',
      name: 'Sprite Drink',
      imgUrl: 'https://pngimg.com/d/sprite_PNG98773.png',
      category: 'Drink',
      price: 3.99),
  ProductItem(
      id: '9',
      name: 'Checkin Taco',
      imgUrl:
          'https://tacotimenw.com/wp-content/uploads/2018/10/Baja-Taco-CHICKEN.png',
      category: 'Taco',
      price: 21.5),
  ProductItem(
      id: '10',
      name: 'Beef Taco',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/025/280/094/original/ai-generative-beef-taco-food-with-salad-and-cheese-for-advertising-png.png',
      category: 'Taco',
      price: 29.99),
];
