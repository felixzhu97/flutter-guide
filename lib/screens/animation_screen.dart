import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late AnimationController _colorController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();

    // 淡入淡出动画
    _fadeController = AnimationController(
      vsync: this,
      duration: AppConstants.mediumAnimationDuration,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // 缩放动画
    _scaleController = AnimationController(
      vsync: this,
      duration: AppConstants.mediumAnimationDuration,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // 旋转动画
    _rotationController = AnimationController(
      vsync: this,
      duration: AppConstants.longAnimationDuration,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    // 滑动动画
    _slideController = AnimationController(
      vsync: this,
      duration: AppConstants.mediumAnimationDuration,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    // 颜色动画
    _colorController = AnimationController(
      vsync: this,
      duration: AppConstants.longAnimationDuration,
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _slideController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  void _toggleAnimations() {
    setState(() {
      _isAnimated = !_isAnimated;
      if (_isAnimated) {
        _fadeController.forward();
        _scaleController.forward();
        _rotationController.repeat();
        _slideController.forward();
        _colorController.repeat(reverse: true);
      } else {
        _fadeController.reverse();
        _scaleController.reverse();
        _rotationController.stop();
        _rotationController.reset();
        _slideController.reverse();
        _colorController.stop();
        _colorController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画演示'),
        actions: [
          IconButton(
            icon: Icon(_isAnimated ? Icons.pause : Icons.play_arrow),
            onPressed: _toggleAnimations,
            tooltip: _isAnimated ? '停止动画' : '开始动画',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              '淡入淡出动画 (Fade)',
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  child:
                      const Icon(Icons.opacity, color: Colors.white, size: 48),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '缩放动画 (Scale)',
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  child:
                      const Icon(Icons.zoom_in, color: Colors.white, size: 48),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '旋转动画 (Rotation)',
              RotationTransition(
                turns: _rotationAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  child:
                      const Icon(Icons.refresh, color: Colors.white, size: 48),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '滑动动画 (Slide)',
              SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  child: const Icon(Icons.swipe, color: Colors.white, size: 48),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '颜色动画 (Color)',
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius:
                          BorderRadius.circular(AppConstants.defaultRadius),
                    ),
                    child: const Icon(Icons.palette,
                        color: Colors.white, size: 48),
                  );
                },
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '组合动画 (Combined)',
              AnimatedBuilder(
                animation: Listenable.merge([
                  _fadeController,
                  _scaleController,
                  _rotationController,
                ]),
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: RotationTransition(
                        turns: _rotationAnimation,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.secondary,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                AppConstants.defaultRadius),
                          ),
                          child: const Icon(Icons.auto_awesome,
                              color: Colors.white, size: 48),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: AppConstants.smallPadding),
                        Text(
                          '动画说明',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.defaultPadding),
                    const Text(
                      '• 淡入淡出：使用 FadeTransition 实现透明度变化\n'
                      '• 缩放：使用 ScaleTransition 实现大小变化\n'
                      '• 旋转：使用 RotationTransition 实现旋转效果\n'
                      '• 滑动：使用 SlideTransition 实现位置移动\n'
                      '• 颜色：使用 AnimatedBuilder 实现颜色渐变\n'
                      '• 组合：多个动画同时运行',
                      style: TextStyle(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    Widget animationWidget,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        Center(child: animationWidget),
      ],
    );
  }
}
