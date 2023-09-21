import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_item.dart';
import 'package:food_delivery/widgets/product_detail_info.dart';

class ProductDetails extends StatefulWidget {
  final ProductItem productItem;
  const ProductDetails({super.key, required this.productItem});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductItem tempProductItem;
  int _quantity = 1;
  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  @override
  void initState() {
    super.initState();
    tempProductItem = widget.productItem;
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(tempProductItem.name),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                int selectedItemIndex = products.indexOf(tempProductItem);
                products[selectedItemIndex] = tempProductItem.copyItem(
                    isFav: !tempProductItem.isFavorite);
                tempProductItem = products[selectedItemIndex];
              });
            },
            icon: Icon(
              tempProductItem.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(width: 12.0),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          tempProductItem.imgUrl,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tempProductItem.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    tempProductItem.category,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: _quantity > 1
                                          ? _decreaseQuantity
                                          : null,
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      _quantity.toString(),
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _increaseQuantity,
                                      icon: const Icon(
                                        Icons.add,
                                        size: 24.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDetailInfo(
                                title: 'Size',
                                value: tempProductItem.size,
                              ),
                              const SizedBox(
                                  height: 40, child: VerticalDivider()),
                              ProductDetailInfo(
                                title: 'Calories',
                                value: tempProductItem.calories,
                              ),
                              const SizedBox(
                                  height: 40, child: VerticalDivider()),
                              ProductDetailInfo(
                                title: 'Cocking',
                                value: tempProductItem.cocking,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(
                      tempProductItem.description,
                      style: const TextStyle(
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '\$${(tempProductItem.price * _quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: const Text('Checkout'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
