

import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/advanced_drawer/advanced_drawer.dart';
import '../core/widgets/advanced_drawer/drawer_controller.dart';
import 'drawer.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: AdvancedDrawerController(),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      backdropColor: context.appTheme.primary,
      drawer: const CustomMainDrawer(),
      child: Scaffold(
        body: widget.navigationShell,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10), // Adjust the bottom padding to 0
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                selectedLabelStyle: context.appTextStyle.bodyLarge,
                unselectedLabelStyle: context.appTextStyle.bodyMedium,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                unselectedItemColor: Colors.grey.shade500,
                selectedItemColor: Colors.lightGreen,
                elevation: 0,
                backgroundColor: Colors.blueGrey.shade700,

                items:  const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
                ],
                currentIndex: widget.navigationShell.currentIndex,
                onTap: (index) => _onItemTapped(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

Widget a(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedLabelStyle: context.appTextStyle.bodyLarge,
          unselectedLabelStyle: context.appTextStyle.bodyMedium,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.blue,
          elevation: 0,
          backgroundColor: context.appTheme.primary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Watch List"),
            // _navBarItem("UiKitAssets.icons.home", 'Home', 0),
            // _navBarItem("UiKitAssets.icons.clock", 'My visits', 1),
            // _navBarItem("UiKitAssets.icons.doctor", 'New visit', 2),
            // _navBarItem("UiKitAssets.icons.document", 'Documents', 3),
            // _navBarItem("UiKitAssets.icons.pulse", 'Results', 4),
          ],
          // currentIndex: widget.navigationShell.currentIndex,
          currentIndex: 4,
          // onTap: (index) => _onItemTapped(index),
          onTap: (index) {},
        ),
      ),
    ),
  );
}

// Widget a(){
//   return AdvancedDrawer(
//     backdrop: Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: const BoxDecoration(color: Color(0xff1E2127)),
//     ),
//     controller: homeViewModel.advancedDrawerController,
//     animationCurve: Curves.easeInOut,
//     animationDuration: const Duration(milliseconds: 300),
//     animateChildDecoration: true,
//     rtlOpening: false,
//     disabledGestures: false,
//     childDecoration: const BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(16)),
//     ),
//     drawer:  Drawer(
//       child: Padding(
//         padding: REdgeInsets.symmetric(horizontal: 8),
//         child:  Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               child: ListTile(
//                 title:  Text("Theme switch", style: TextStyle(
//                     color: context.theme.primaryColor
//                 ),),
//                 trailing: SizedBox(
//                   child: AnimatedToggleSwitch<bool>.dual(
//                     current: ThemeController().isLight,
//                     first: false,
//                     second: true,
//                     spacing: 20.w,
//                     style: const ToggleStyle(
//                       borderColor: Colors.transparent,
//                       backgroundColor: Colors.grey,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           spreadRadius: 1,
//                           blurRadius: 2,
//                           offset: Offset(0, 1.5),
//                         ),
//                       ],
//                     ),
//                     borderWidth: 5,
//                     height: 40.h,
//                     onChanged: (b) => setState((){
//                       bool a = ThemeController().isLight;
//                       log(a.toString());
//                       ThemeController().switchTheme();
//                     }),
//                     styleBuilder: (b) => ToggleStyle(indicatorColor: b ? Colors.white : Colors.black),
//                     iconBuilder: (value) => value
//                         ? const Icon(Icons.brightness_4_outlined, color: Colors.yellow,)
//                         : const Icon(Icons.brightness_2_outlined, color: Colors.yellow,),
//                     textBuilder: (value) => value
//                         ? const Center(child: Text("Light..."))
//                         : const Center(child: Text("Dark...")),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     child: Scaffold(
//       body: widget.child,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Padding(
//         padding: REdgeInsets.symmetric(horizontal: 15),
//         child: Container(
//           margin: EdgeInsets.zero,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 0.5),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: BlurWidget(
//             radius: 10.r,
//             blur: 4,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.r),
//               child: BottomNavigationBar(
//                 currentIndex: homeViewModel.selectedIndex,
//                 unselectedItemColor: Colors.grey,
//                 selectedItemColor: Colors.black,
//                 onTap: (index) {
//                   homeViewModel.onPageChanged(index: index, context: context);
//                 },
//                 items: const [
//                   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//                   BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//                   BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Favorite"),
//                   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
