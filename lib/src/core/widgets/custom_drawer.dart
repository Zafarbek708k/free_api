import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.child, super.key});
 final  Widget child;

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: const Color(0xff1E2127),
    child: child,
  );
}
