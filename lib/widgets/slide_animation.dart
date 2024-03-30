import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    super.key,
    this.delay = 0,
    required this.child,
    this.startOffset = const Offset(0, 1),
    this.duration = 600,
  });

  final int delay;
  final Widget child;
  final Offset startOffset;
  final int duration;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: widget.delay));
      if (!mounted) return;
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.startOffset,
        end: Offset.zero,
      ).animate(animationController),
      child: widget.child,
    );
  }
}
