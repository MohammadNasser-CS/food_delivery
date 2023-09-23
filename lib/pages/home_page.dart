import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_item.dart';
import 'package:food_delivery/pages/product_details_page.dart';
import 'package:food_delivery/widgets/app_bar.dart';
import 'package:food_delivery/models/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;
  late List<ProductItem> filterdProducts;

  @override
  void initState() {
    super.initState();
    filterdProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://marketplace.canva.com/EAFf9vDM9YA/1/0/1600w/canva-blue-menu-special-and-restaurant-food-banner-0fg4aXqLzJ4.jpg',
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 35,
                  ),
                  hintText: 'Search Your Food...',
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedCategoryIndex == null ||
                              selectedCategoryIndex != index) {
                            selectedCategoryIndex = index;
                          } else {
                            selectedCategoryIndex = null;
                            filterdProducts = products;
                          }
                        });
                        if (selectedCategoryIndex != null) {
                          final selectedCategory =
                              category[selectedCategoryIndex!];
                          filterdProducts = products
                              .where((element) =>
                                  element.category == selectedCategory.name)
                              .toList();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                category[index].assetImgPath,
                                height: 50,
                                width: 50,
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                              Text(
                                category[index].name,
                                style: TextStyle(
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.8,
                ),
                itemCount: filterdProducts.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () async {
                    await Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetails(productItem: filterdProducts[index]),
                      ),
                    )
                        .then((value) {
                      setState(() => {});
                      debugPrint(value.toString());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                filterdProducts[index].imgUrl,
                                height: 100,
                                width: 90,
                              ),
                              Text(
                                filterdProducts[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                filterdProducts[index].category,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$ ${filterdProducts[index].price}',
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  int selectedItemIndex =
                                      products.indexOf(filterdProducts[index]);
                                  products[selectedItemIndex] =
                                      filterdProducts[index].copyItem(
                                          isFav: !filterdProducts[index]
                                              .isFavorite);
                                  filterdProducts[index] =
                                      products[selectedItemIndex];
                                },
                              );
                            },
                            icon: Icon(
                              filterdProducts[index].isFavorite == false
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
