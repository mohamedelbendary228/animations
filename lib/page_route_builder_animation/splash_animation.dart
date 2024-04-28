import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = Tween<double>(begin: 1.0, end: 10.0).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return const Destination();
          }, transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
            // final tweenPosition =
            //     Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            //         .animate(animation);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }),
        );

        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            controller.reset();
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
      body: const Center(
        child: Text(
          "Welcome to Destination",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
