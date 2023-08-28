import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.grid_view_outlined,
                size: 30,
              ),
            ),
          ),
        ),
        const Column(
          children: [
            Text('Current Location',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                SizedBox(width: 4),
                Text(
                  'Tulkarm, Palestine',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
        InkWell(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.notifications_none,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
