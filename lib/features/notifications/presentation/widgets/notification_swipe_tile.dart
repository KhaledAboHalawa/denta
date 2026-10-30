import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_icons.dart';

class NotificationSwipeTile extends StatefulWidget {
  const NotificationSwipeTile({
    required this.child,
    required this.onDelete,
    super.key,
  });

  final Widget child;

  final VoidCallback onDelete;

  @override
  State<NotificationSwipeTile> createState() => _NotificationSwipeTileState();
}

class _NotificationSwipeTileState extends State<NotificationSwipeTile>
    with TickerProviderStateMixin {
  static const double _actionExtent = 102;
  static const Duration _settleDuration = Duration(milliseconds: 220);
  static const Duration _collapseDuration = Duration(milliseconds: 260);

  static const double _flingVelocity = 700;

  late final AnimationController _reveal = AnimationController(vsync: this);

  late final AnimationController _collapse = AnimationController(
    vsync: this,
    duration: _collapseDuration,
  );
  late final Animation<double> _collapseFactor = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(CurvedAnimation(parent: _collapse, curve: Curves.easeInOut));

  bool _deleting = false;

  bool get _isRtl => Directionality.of(context) == TextDirection.rtl;

  @override
  void dispose() {
    _reveal.dispose();
    _collapse.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_deleting) return;
    final towardStart = _isRtl ? details.delta.dx : -details.delta.dx;
    _reveal.value += towardStart / _actionExtent;
  }

  void _onDragEnd(DragEndDetails details) {
    if (_deleting) return;
    final velocity = details.primaryVelocity ?? 0;
    final towardStartVelocity = _isRtl ? velocity : -velocity;
    final open = towardStartVelocity.abs() > _flingVelocity
        ? towardStartVelocity > 0
        : _reveal.value > 0.5;
    _settle(open: open);
  }

  void _settle({required bool open}) {
    _reveal.animateTo(
      open ? 1 : 0,
      duration: _settleDuration,
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _requestDelete() async {
    if (_deleting) return;
    setState(() => _deleting = true);
    await _collapse.forward();
    if (!mounted) return;
    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textDirection = Directionality.of(context);

    return SizeTransition(
      sizeFactor: _collapseFactor,
      child: FadeTransition(
        opacity: _collapseFactor,
        child: AnimatedBuilder(
          animation: _reveal,
          child: widget.child,
          builder: (context, child) {
            final reveal = _reveal.value;
            final isRevealed = reveal > 0;
            final dx = (_isRtl ? 1 : -1) * _actionExtent * reveal;

            return Stack(
              fit: StackFit.passthrough,
              children: [
                if (isRevealed)
                  Positioned.directional(
                    textDirection: textDirection,
                    end: 0,
                    top: 0,
                    bottom: 0,
                    width: _actionExtent * reveal,
                    child: ClipRect(
                      child: OverflowBox(
                        alignment: AlignmentDirectional.centerEnd,
                        minWidth: _actionExtent,
                        maxWidth: _actionExtent,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: reveal > 0.5 ? _requestDelete : null,
                          child: ColoredBox(
                            color: colors.error,
                            child: Center(
                              child: Opacity(
                                opacity: reveal,
                                child: Transform.scale(
                                  scale: 0.6 + 0.4 * reveal,
                                  child: SvgPicture.asset(
                                    AppIcons.trash,
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                      colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Transform.translate(
                  offset: Offset(dx, 0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    onTap: isRevealed ? () => _settle(open: false) : null,
                    child: IgnorePointer(
                      ignoring: isRevealed || _deleting,
                      child: child,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
