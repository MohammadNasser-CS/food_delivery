import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/order_coupons.dart';
import 'package:food_delivery/widgets/profile_listTile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24.0),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://userstock.io/data/wp-content/uploads/2020/05/warren-wong-VVEwJJRRHgk-1024x1024.jpg'),
              ),
              SizedBox(height: 24.0),
              Text(
                'Mohammad Nasser',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                'Front-end Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrderCouponsWidget(title: 'Orders', value: 10),
                  SizedBox(height: 60, child: VerticalDivider()),
                  OrderCouponsWidget(title: 'Coupons', value: 5),
                ],
              ),
              SizedBox(height: 24.0),
              ProfileListTile(
                icon: Icons.shopping_cart_outlined,
                title: 'Your Orders',
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ProfileListTile(
                icon: Icons.card_giftcard_outlined,
                title: 'Coupons',
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
