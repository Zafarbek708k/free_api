import "package:flutter/material.dart";

import "../../../../core/widgets/text_widget.dart";

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: CustomTextWidget("Search Detail", textColor: Colors.black),
    ),
  );
}
