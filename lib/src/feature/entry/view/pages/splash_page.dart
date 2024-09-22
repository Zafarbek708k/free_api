import "dart:async";
import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "package:free_api/src/core/storage/app_storage.dart";
import "package:lottie/lottie.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/app_material_context.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final String? enterUser;

  Future<bool?> isEnterUser() async {
    enterUser = await AppStorage.$read(key: StorageKey.enter);
    log(enterUser ?? "enter user = null");
    if (enterUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  //   // void didChangeDependencies() async {
  //   //   bool? a = await isEnterUser();
  //   //   log("a ==  $a");
  //   //   Timer(const Duration(seconds: 2), () {
  //   //     if (a != null && a == true) {
  //   //       context.go(AppRouteName.home);
  //   //     } else {
  //   //       context.go(AppRouteName.welcomePage);
  //   //     }
  //   //   });
  //   //   super.didChangeDependencies();
  //   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset('assets/lottie/splash.json'),
              Text("Code Guide", style: context.appTextStyle.bodyLarge),
              MaterialButton(
                onPressed: () async {
                  themeController.switchTheme(); // Using the shared instance
                },
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.deepOrange),
                ),
                child: const Text("Theme"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Example of using color them and locale

///     Text(
//                 context.localized.welcome3description,
//                 style: context.appTextStyle.bodyMedium,
//               ),
//               MaterialButton(
//                 onPressed: () async {
//                   themeController.switchTheme(); // Using the shared instance
//                 },
//                 shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
//                 child: Text(
//                   "switch them",
//                   style: TextStyle(color:  Theme.of(context).colorScheme.secondary),
//                 ),
//               ),
//
//               MaterialButton(
//                 onPressed: () async {
//                   localController.changeLocal(LangCodes.en);
//                 },
//                 shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
//                 child: Text(
//                   "switch Lang",
//                   style: TextStyle(color:  Theme.of(context).colorScheme.secondary),
//                 ),
//               ),
//
