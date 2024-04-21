import 'package:flutter/material.dart';

class DrawerScreens extends StatelessWidget {
  const DrawerScreens({super.key, required this.pickDrawer});
  final void Function(String mess) pickDrawer;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 202, 86, 111),
            ),
            child: Icon(Icons.no_meals_ouline, size: 50),
          ),
          ListTile(
            title: const Text('Meal'),
            onTap: () {
              pickDrawer('Meal');
            },
          ),
          ListTile(
            title: const Text('Fitlers'),
            onTap: () {
              pickDrawer('Fitlers');
            },
          ),
        ],
      ),
    );
  }
}
