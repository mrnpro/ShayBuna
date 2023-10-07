import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.child,
    this.margin,
    this.padding,
  });
  final double? height;
  final double? width;

  final double? radius;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    animation = ColorTween(
            begin: const Color.fromARGB(255, 218, 202, 189),
            end: const Color.fromARGB(255, 203, 186, 172))
        .animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
          margin: widget.margin,
          padding: widget.padding ?? EdgeInsets.all(30.h),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: animation.value,
              borderRadius: BorderRadius.circular(widget.radius ?? 12)),
          child: widget.child),
    );
  }
}
