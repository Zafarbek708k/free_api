import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "../../../../../riverpod.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/text_widget.dart";
import "../widgets/onboarding_content_widget.dart";



class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(entryController);
    final controller = ref.read(entryController);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(controller.images[controller.currentPage]),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.onPageChanged(index);
              },
              children:  [
                OnBoardingContent(
                  title: context.localized.welcome1title,
                  description: context.localized.welcome1description,
                ),
                OnBoardingContent(
                  title: context.localized.welcome2title,
                  description: context.localized.welcome2description,
                ),
                OnBoardingContent(
                  title: context.localized.welcome3title,
                  description:context.localized.welcome3description,
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.currentPage == 2
                        ? () {context.go(AppRouteName.home);}
                        : () {
                      log("A");
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: CustomTextWidget(controller.currentPage > 1 ? "Get Started" : "Next", textColor: context.appTheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

