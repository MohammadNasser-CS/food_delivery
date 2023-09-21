import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.0),
            CircleAvatar(
              radius: 50,
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
          ],
        ),
      ),
    );
  }
}
