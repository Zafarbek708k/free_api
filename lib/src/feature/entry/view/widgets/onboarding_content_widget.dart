
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "../../../../core/widgets/text_widget.dart";

class OnBoardingContent extends StatefulWidget {
  final String? title;
  final String? description;

  const OnBoardingContent({
    required this.title, required this.description, super.key,
  });

  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  @override
  Widget build(BuildContext context) => Padding(
    padding:  REdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 75),
        CustomTextWidget(
          widget.title??"title",
          textColor: context.appTheme.onPrimaryContainer,
        ),
        const SizedBox(height: 16),
        CustomTextWidget(
          widget.description??"description",
          textAlign: TextAlign.center,
          textColor: context.appTheme.onPrimaryContainer,
        ),
      ],
    ),
  );
}