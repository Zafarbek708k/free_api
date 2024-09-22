import "package:device_preview/device_preview.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CustomScreenUtil extends StatelessWidget {
  const CustomScreenUtil({required this.child, required this.enabledPreview, super.key});

  final Widget child;
  final bool enabledPreview;

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) => KeyboardDismisser(
            gestures: const [GestureType.onTap],
            child: DevicePreview(enabled: kDebugMode && enabledPreview, builder: (context) => child)),
      );
}
