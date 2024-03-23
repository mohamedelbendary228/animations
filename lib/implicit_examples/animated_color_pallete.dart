import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateRandomPalette();

  bool animatedContainer = false;

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }

  void startAnimation() {
    setState(() {
      animatedContainer = !animatedContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color Palette Generator'),
        ),
        body: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideInUp(
                from: 100,
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear,
                animate: animatedContainer,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  margin: const EdgeInsets.all(8),
                ),
              ),
              FadeInUp(
                from: 400,
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear,
                animate: animatedContainer,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  margin: const EdgeInsets.all(8),
                ),
              ),
              ElevatedButton(
                onPressed: startAnimation,
                child: const Text('Start animation'),
              ),
            ],
          ),
        )

        );
  }
}
