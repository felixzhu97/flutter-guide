import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/locale_provider.dart';
import '../utils/app_localizations.dart';
import '../constants/app_constants.dart';
import '../widgets/feature_card.dart';
import 'components_screen.dart';
import 'counter_screen.dart';
import 'todo_screen.dart';
import 'network_screen.dart';
import 'animation_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.appName ?? AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '欢迎来到Flutter学习之旅',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              '这是一个完整的Flutter技术入门与实践案例，包含了常用的功能模块和最佳实践。',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            Text(
              '功能模块',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppConstants.defaultPadding,
              mainAxisSpacing: AppConstants.defaultPadding,
              childAspectRatio: 1.2,
              children: [
                FeatureCard(
                  icon: Icons.widgets,
                  title: localizations?.components ?? '组件',
                  description: '基础UI组件展示',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComponentsScreen(),
                      ),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.add_circle_outline,
                  title: localizations?.counter ?? '计数器',
                  description: '状态管理示例',
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterScreen(),
                      ),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.check_circle_outline,
                  title: localizations?.todoList ?? '待办事项',
                  description: '数据管理和本地存储',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoScreen(),
                      ),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.cloud_outlined,
                  title: localizations?.network ?? '网络请求',
                  description: 'API调用和数据处理',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NetworkScreen(),
                      ),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.animation,
                  title: localizations?.animation ?? '动画',
                  description: '各种动画效果',
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnimationScreen(),
                      ),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.palette,
                  title: localizations?.theme ?? '主题',
                  description: '主题切换和样式',
                  color: Colors.teal,
                  onTap: () {
                    context.read<ThemeProvider>().toggleTheme();
                  },
                ),
              ],
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
                          '关于此应用',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.smallPadding),
                    Text(
                      '这个应用展示了Flutter开发中的各种技术和最佳实践，包括状态管理、网络请求、本地存储、动画效果、主题切换、国际化等功能。',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LocaleProvider>().toggleLocale();
        },
        child: const Icon(Icons.language),
      ),
    );
  }
}
