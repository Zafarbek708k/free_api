// import "dart:developer";
//
// import "package:animated_toggle_switch/animated_toggle_switch.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import "package:flutter_advanced_drawer/flutter_advanced_drawer.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:flutter_screenutil/flutter_screenutil.dart";
// import "package:movie_app/src/core/constants/context_extension.dart";
//
// import "../../../../../riverpod.dart";
//
// class MainPage extends ConsumerStatefulWidget {
//   const MainPage({required this.child, super.key});
//
//   final Widget child;
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
// }
//
// class _HomePageState extends ConsumerState<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     ref.watch(homeNavigationController);
//     final homeViewModel = ref.read(homeNavigationController);
//
//     return AdvancedDrawer(
//       backdrop: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(color: Color(0xff1E2127)),
//       ),
//       controller: homeViewModel.advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       animateChildDecoration: true,
//       rtlOpening: false,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(16)),
//       ),
//       drawer:  Drawer(
//         child: Padding(
//           padding: REdgeInsets.symmetric(horizontal: 8),
//           child:  Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Card(
//                 child: ListTile(
//                   title:  Text("Theme switch", style: TextStyle(
//                     color: context.theme.primaryColor
//                   ),),
//                   trailing: SizedBox(
//                     child: AnimatedToggleSwitch<bool>.dual(
//                       current: ThemeController().isLight,
//                       first: false,
//                       second: true,
//                       spacing: 20.w,
//                       style: const ToggleStyle(
//                         borderColor: Colors.transparent,
//                         backgroundColor: Colors.grey,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: Offset(0, 1.5),
//                           ),
//                         ],
//                       ),
//                       borderWidth: 5,
//                       height: 40.h,
//                       onChanged: (b) => setState((){
//                         bool a = ThemeController().isLight;
//                         log(a.toString());
//                         ThemeController().switchTheme();
//                       }),
//                       styleBuilder: (b) => ToggleStyle(indicatorColor: b ? Colors.white : Colors.black),
//                       iconBuilder: (value) => value
//                           ? const Icon(Icons.brightness_4_outlined, color: Colors.yellow,)
//                           : const Icon(Icons.brightness_2_outlined, color: Colors.yellow,),
//                       textBuilder: (value) => value
//                           ? const Center(child: Text("Light..."))
//                           : const Center(child: Text("Dark...")),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       child: Scaffold(
//         body: widget.child,
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: Padding(
//           padding: REdgeInsets.symmetric(horizontal: 15),
//           child: Container(
//             margin: EdgeInsets.zero,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 0.5),
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: BlurWidget(
//               radius: 10.r,
//               blur: 4,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: BottomNavigationBar(
//                   currentIndex: homeViewModel.selectedIndex,
//                   unselectedItemColor: Colors.grey,
//                   selectedItemColor: Colors.black,
//                   onTap: (index) {
//                     homeViewModel.onPageChanged(index: index, context: context);
//                   },
//                   items: const [
//                     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//                     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//                     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Favorite"),
//                     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
