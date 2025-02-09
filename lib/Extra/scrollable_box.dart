import 'package:flutter/material.dart';

class AnimatedBoxScreen extends StatefulWidget {
  const AnimatedBoxScreen({super.key});

  @override
  AnimatedBoxScreenState createState() => AnimatedBoxScreenState();
}

class AnimatedBoxScreenState extends State<AnimatedBoxScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  static const _boxShadow = BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    spreadRadius: 2,
    offset: Offset(0, 4),
  );

  static const _padding = EdgeInsets.symmetric(horizontal: 0.0);
  static const _animationDuration = Duration(milliseconds: 400);

  late final PageController _pageController;
  int _currentPage = 0;
  final Map<int, GlobalKey> _boxKeys = {};

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.5,
      initialPage: _currentPage,
    )..addListener(_handlePageChange);
  }

  void _handlePageChange() {
    final newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  void _onTapBox(int index) {
    if (index == _currentPage) return;

    _pageController.animateToPage(
      index,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );
  }

  GlobalKey _getKeyForIndex(int index) {
    return _boxKeys.putIfAbsent(index, () => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 200,
      width: 411,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        // padEnds: false,
        pageSnapping: true,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 1 - ((_currentPage - index).abs() * 0.5).clamp(0.1, 0.3),
              end: 1 - ((_currentPage - index).abs() * 0.5).clamp(0.1, 0.3),
            ),
            duration: _animationDuration,
            curve: Curves.easeOutCubic,
            builder: (context, double value, child) {
              return RepaintBoundary(
                key: _getKeyForIndex(index),
                child: GestureDetector(
                  onTap: () => _onTapBox(index),
                  child: Transform.scale(
                    scale: value,
                    child: Padding(
                      padding: _padding,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [_boxShadow],
                            color: Theme.of(context).colorScheme.primary),
                        child: Center(
                          child: Text(
                            "Schedule ${index + 1}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
