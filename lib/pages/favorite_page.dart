import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<ProductItem> filterdProducts;
  @override
  void initState() {
    super.initState();
    filterdProducts =
        products.where((element) => element.isFavorite == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return filterdProducts.isNotEmpty
        ? ListView.builder(
            itemCount: filterdProducts.length,
            itemBuilder: (context, index) {
              return filterdProducts[index].isFavorite
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          leading: Image.network(
                            filterdProducts[index].imgUrl,
                            height: 100,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            filterdProducts[index].name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${filterdProducts[index].category} - \$${filterdProducts[index].price}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  int selectedItemIndex =
                                      products.indexOf(filterdProducts[index]);
                                  products[selectedItemIndex] =
                                      filterdProducts[index].copyItem(
                                          isFav: !filterdProducts[index]
                                              .isFavorite);
                                  filterdProducts[index] =
                                      products[selectedItemIndex];
                                      filterdProducts.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.deepOrange,
                              )),
                        ),
                      ),
                    )
                  : null;
            },
          )
        : const Center(
            child: Text('No Favorite Product'),
          );
  }
}
