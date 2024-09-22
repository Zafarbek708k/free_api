import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/app_material_context.dart';
import '../core/widgets/text_widget.dart';
import 'entry/view/widgets/custom_lang_button.dart';

class CustomMainDrawer extends StatelessWidget {
  const CustomMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      backgroundColor: context.appTheme.primary,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LangButton(),
            
            MaterialButton(
              onPressed: () async {
                themeController.switchTheme(); // Using the shared instance
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary
                )
              ),
              child: Text(
                context.localized.switchTheme,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),

            const Spacer(),
            CustomTextWidget(
              "Created by Zafarbek Karimov",
              textColor: context.appTheme.secondary,
            ),

            const SizedBox(height: 50,)



          ],
        ),
      ),
    );
  }
}

