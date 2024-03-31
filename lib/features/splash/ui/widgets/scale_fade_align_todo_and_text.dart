import 'package:flutter/material.dart';

class ScaleFadeAlignTodoAndText extends StatefulWidget {
  final Widget child;
  final Alignment begin;
  final Alignment end;

  const ScaleFadeAlignTodoAndText({
    super.key,
    required this.child,
    required this.begin,
    required this.end,
  });

  @override
  State<ScaleFadeAlignTodoAndText> createState() =>
      _ScaleFadeAlignTodoAndTextState();
}

class _ScaleFadeAlignTodoAndTextState extends State<ScaleFadeAlignTodoAndText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    controlScaleAnimated();
    controlAlignmentAnimated();
    controlFadeAnimated();
  }

  void controlScaleAnimated() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _scaleAnimation = Tween(begin: 0.5, end: 1.0).animate(_controller);
  }

  void controlAlignmentAnimated() {
    _alignmentAnimation =
        AlignmentTween(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
  }

  void controlFadeAnimated() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    )..forward();

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_fadeController);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AlignTransition(
        alignment: _alignmentAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }
}
