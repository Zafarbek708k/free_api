import "dart:async";
import "package:flutter/material.dart";
import "package:free_api/src/core/widgets/text_widget.dart";
import "package:go_router/go_router.dart";
import "package:free_api/src/core/constants/context_extension.dart";
import "package:lottie/lottie.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/widgets/app_material_context.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
              Lottie.asset('assets/lottie/hand_loading.json'),

              Button(onPressed: (){
                context.push(AppRouteName.speechToText);
              }, title: "Speech To Text"),
              Button(onPressed: (){
                context.push(AppRouteName.animation);
              }, title: "Animation"),
              Button(onPressed: (){
                context.push(AppRouteName.chat);
              }, title: "Chat screen"),
              Button(onPressed: (){
                context.push(AppRouteName.doubleChat);
              }, title: "Double Chat screen"),
              Button(onPressed: (){
                context.push(AppRouteName.home);
              }, title: "Image to Screen"),
              Button(onPressed: (){
                context.push(AppRouteName.home);
              }, title: "Qr code Generator"),
              Button(onPressed: (){
                themeController.switchTheme(); //
              }, title: "Theme"),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape:  StadiumBorder(
        side: BorderSide(
          color: context.appTheme.secondary,
        ),
      ),
      child: CustomTextWidget(title,textColor: context.appTheme.secondary,fontSize: 24,fontWeight: FontWeight.bold, ),
    );
  }
}
