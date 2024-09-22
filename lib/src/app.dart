
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "core/widgets/app_material_context.dart";
import "core/widgets/custom_screen_util.dart";

class App extends StatelessWidget {
  const App({super.key});

  static void run()=> runApp(const ProviderScope(child: App()));

  @override
  Widget build(BuildContext context) => const CustomScreenUtil(enabledPreview: true, child: AppMaterialContext());
}

