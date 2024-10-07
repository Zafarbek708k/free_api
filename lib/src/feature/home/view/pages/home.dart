import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:free_api/src/feature/image_to_text/view/pages/image_to_text_page.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {


  List<Widget> pages =[const ImageToTextPage()];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        children: pages,
      )
    );
  }
}
