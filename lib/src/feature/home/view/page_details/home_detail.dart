import "package:flutter/material.dart";
import "package:free_api/src/core/widgets/text_widget.dart";

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Center(
        child: CustomTextWidget("Home Detail", textColor: Colors.black),
      ),
    );
}
