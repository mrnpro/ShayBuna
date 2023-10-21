import 'package:coffee_shop/Models/coffee_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/common_widgets.dart';

class CircleAnimationImage extends StatefulWidget {
  const CircleAnimationImage({super.key, required this.coffee});
  final CoffeeModel coffee;
  @override
  _CircleAnimationImageState createState() => _CircleAnimationImageState();
}

class _CircleAnimationImageState extends State<CircleAnimationImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double radius = 50.0;
  final double angle = 0.0;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    // Create a curved animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Add a listener to update the UI when animation values change
    _animation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Transform.rotate(
      angle: _animation.value * 1.2,
      child: Hero(
        tag: widget.coffee.pid,
        child: Container(
          width: 241,
          height: 264,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(Assets.assetsCoffeeCap),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ));
  }
}
