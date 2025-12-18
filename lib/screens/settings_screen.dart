import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/locale_provider.dart';
import '../constants/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          _buildSection(
            context,
            '外观设置',
            [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return ListTile(
                    leading: const Icon(Icons.brightness_6),
                    title: const Text('主题模式'),
                    subtitle: Text(_getThemeModeText(themeProvider.themeMode)),
                    trailing: DropdownButton<ThemeMode>(
                      value: themeProvider.themeMode,
                      items: const [
                        DropdownMenuItem(
                          value: ThemeMode.system,
                          child: Text('跟随系统'),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text('浅色模式'),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text('深色模式'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          themeProvider.setThemeMode(value);
                        }
                      },
                    ),
                  );
                },
              ),
              const Divider(),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return ListTile(
                    leading: const Icon(Icons.palette),
                    title: const Text('切换主题'),
                    subtitle: const Text('快速切换主题模式'),
                    trailing: Switch(
                      value: themeProvider.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                    onTap: () {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          _buildSection(
            context,
            '语言设置',
            [
              Consumer<LocaleProvider>(
                builder: (context, localeProvider, child) {
                  return ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('应用语言'),
                    subtitle: Text(
                      localeProvider.locale.languageCode == 'zh'
                          ? '简体中文'
                          : 'English',
                    ),
                    trailing: DropdownButton<Locale>(
                      value: localeProvider.locale,
                      items: const [
                        DropdownMenuItem(
                          value: Locale('zh', 'CN'),
                          child: Text('简体中文'),
                        ),
                        DropdownMenuItem(
                          value: Locale('en', 'US'),
                          child: Text('English'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          localeProvider.setLocale(value);
                        }
                      },
                    ),
                  );
                },
              ),
              const Divider(),
              Consumer<LocaleProvider>(
                builder: (context, localeProvider, child) {
                  return ListTile(
                    leading: const Icon(Icons.translate),
                    title: const Text('切换语言'),
                    subtitle: const Text('在中文和英文之间切换'),
                    onTap: () {
                      localeProvider.toggleLocale();
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          _buildSection(
            context,
            '关于',
            [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('应用名称'),
                subtitle: Text(AppConstants.appName),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.tag),
                title: const Text('版本号'),
                subtitle: Text(AppConstants.appVersion),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('应用说明'),
                subtitle: const Text(
                  '这是一个完整的Flutter技术入门与实践案例，'
                  '包含了常用的功能模块和最佳实践。',
                ),
                isThreeLine: true,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: AppConstants.smallPadding),
                      Text(
                        '提示',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  Text(
                    '• 主题设置会立即生效并保存到本地\n'
                    '• 语言设置需要重启应用才能完全生效\n'
                    '• 所有设置都会自动保存',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.defaultPadding,
            bottom: AppConstants.smallPadding,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  String _getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return '跟随系统';
      case ThemeMode.light:
        return '浅色模式';
      case ThemeMode.dark:
        return '深色模式';
    }
  }
}
