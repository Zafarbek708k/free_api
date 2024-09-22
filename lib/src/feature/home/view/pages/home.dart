import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Home> {


  List<Widget> pages =[Scaffold()];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        children: pages,
      )
    );
  }
}
