import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
                onTap: (){},
                leading:  Icon(
                  icon,
                  size: 30,
                ),
                title:  Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              );
  }
}
