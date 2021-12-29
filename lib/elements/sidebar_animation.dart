import 'package:flutter/material.dart';

class SidebarAnimation extends StatefulWidget {
  final Widget Function(AnimationController) mainScreen;
  final Widget Function(AnimationController) sidebar;

  const SidebarAnimation(
      {Key? key, required this.sidebar, required this.mainScreen})
      : super(key: key);

  @override
  State<SidebarAnimation> createState() => _SidebarAnimationState();
}

class _SidebarAnimationState extends State<SidebarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            widget.sidebar(controller),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0),
                end: const Offset(0.7, 0),
              ).animate(
                CurvedAnimation(
                    parent: controller, curve: Curves.easeInOutBack),
              ),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1, end: 0.8).animate(
                  CurvedAnimation(
                      parent: controller, curve: Curves.easeInOutBack),
                ),
                child: widget.mainScreen(controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
