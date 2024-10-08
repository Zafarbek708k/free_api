import 'package:flutter/material.dart';

class CustomPulseAnimation extends StatefulWidget {
  const CustomPulseAnimation({super.key});

  @override
  State<CustomPulseAnimation> createState() => _CustomPulseAnimationState();
}

class _CustomPulseAnimationState extends State<CustomPulseAnimation> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<BorderRadius> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<BorderRadius>(
      begin:  BorderRadius.circular(10),
      end: BorderRadius.circular(150),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    ));

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _animationController.repeat();
      }
    });


    super.initState();
  }

  void _play(){
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // app bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pulse Animation"),
      ),

      //body
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: _animation.value,
                ),
                height:250,
                width: 350,
              );
            }
        ),
      ),

      // play
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _play,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
