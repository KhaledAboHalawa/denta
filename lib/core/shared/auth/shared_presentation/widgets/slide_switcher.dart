import 'package:flutter/cupertino.dart';

class SlideSwitcher extends StatefulWidget {
  const SlideSwitcher({super.key, required this.index, required this.children});

  final int index;
  final List<Widget> children;

  @override
  State<SlideSwitcher> createState() => _SlideSwitcherState();
}

class _SlideSwitcherState extends State<SlideSwitcher> {
  bool _forward = true;

  @override
  void didUpdateWidget(covariant SlideSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index) {
      _forward = widget.index > oldWidget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [...previousChildren, ?currentChild],
            );
          },
          transitionBuilder: (child, animation) {
            final isIncoming = child.key == ValueKey(widget.index);
            final dx = isIncoming
                ? (_forward ? 1.0 : -1.0)
                : (_forward ? -1.0 : 1.0);

            return SlideTransition(
              textDirection:Directionality.of(context),
              position: Tween<Offset>(
                begin: Offset(dx, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey(widget.index),
            child: widget.children[widget.index],
          ),
        ),
      ),
    );
  }
}
