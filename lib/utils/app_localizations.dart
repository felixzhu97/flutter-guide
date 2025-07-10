import 'package:flutter/material.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final Locale locale;

  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    'zh': {
      'app_name': 'Flutter技术入门与实践',
      'home': '首页',
      'components': '组件',
      'state_management': '状态管理',
      'network': '网络请求',
      'storage': '本地存储',
      'navigation': '导航',
      'animation': '动画',
      'theme': '主题',
      'language': '语言',
      'settings': '设置',
      'about': '关于',
      'counter': '计数器',
      'todo_list': '待办事项',
      'user_profile': '用户资料',
      'posts': '文章',
      'comments': '评论',
      'loading': '加载中...',
      'error': '错误',
      'retry': '重试',
      'save': '保存',
      'cancel': '取消',
      'delete': '删除',
      'edit': '编辑',
      'add': '添加',
      'search': '搜索',
      'no_data': '暂无数据',
      'network_error': '网络连接失败',
      'unknown_error': '未知错误',
      'success': '成功',
      'failed': '失败',
      'light_theme': '浅色主题',
      'dark_theme': '深色主题',
      'system_theme': '跟随系统',
      'chinese': '中文',
      'english': '英文',
    },
    'en': {
      'app_name': 'Flutter Guide & Practice',
      'home': 'Home',
      'components': 'Components',
      'state_management': 'State Management',
      'network': 'Network',
      'storage': 'Storage',
      'navigation': 'Navigation',
      'animation': 'Animation',
      'theme': 'Theme',
      'language': 'Language',
      'settings': 'Settings',
      'about': 'About',
      'counter': 'Counter',
      'todo_list': 'Todo List',
      'user_profile': 'User Profile',
      'posts': 'Posts',
      'comments': 'Comments',
      'loading': 'Loading...',
      'error': 'Error',
      'retry': 'Retry',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'edit': 'Edit',
      'add': 'Add',
      'search': 'Search',
      'no_data': 'No Data',
      'network_error': 'Network Error',
      'unknown_error': 'Unknown Error',
      'success': 'Success',
      'failed': 'Failed',
      'light_theme': 'Light Theme',
      'dark_theme': 'Dark Theme',
      'system_theme': 'System Theme',
      'chinese': 'Chinese',
      'english': 'English',
    },
  };

  String get appName => _localizedValues[locale.languageCode]!['app_name']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get components =>
      _localizedValues[locale.languageCode]!['components']!;
  String get stateManagement =>
      _localizedValues[locale.languageCode]!['state_management']!;
  String get network => _localizedValues[locale.languageCode]!['network']!;
  String get storage => _localizedValues[locale.languageCode]!['storage']!;
  String get navigation =>
      _localizedValues[locale.languageCode]!['navigation']!;
  String get animation => _localizedValues[locale.languageCode]!['animation']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get about => _localizedValues[locale.languageCode]!['about']!;
  String get counter => _localizedValues[locale.languageCode]!['counter']!;
  String get todoList => _localizedValues[locale.languageCode]!['todo_list']!;
  String get userProfile =>
      _localizedValues[locale.languageCode]!['user_profile']!;
  String get posts => _localizedValues[locale.languageCode]!['posts']!;
  String get comments => _localizedValues[locale.languageCode]!['comments']!;
  String get loading => _localizedValues[locale.languageCode]!['loading']!;
  String get error => _localizedValues[locale.languageCode]!['error']!;
  String get retry => _localizedValues[locale.languageCode]!['retry']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get delete => _localizedValues[locale.languageCode]!['delete']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get add => _localizedValues[locale.languageCode]!['add']!;
  String get search => _localizedValues[locale.languageCode]!['search']!;
  String get noData => _localizedValues[locale.languageCode]!['no_data']!;
  String get networkError =>
      _localizedValues[locale.languageCode]!['network_error']!;
  String get unknownError =>
      _localizedValues[locale.languageCode]!['unknown_error']!;
  String get success => _localizedValues[locale.languageCode]!['success']!;
  String get failed => _localizedValues[locale.languageCode]!['failed']!;
  String get lightTheme =>
      _localizedValues[locale.languageCode]!['light_theme']!;
  String get darkTheme => _localizedValues[locale.languageCode]!['dark_theme']!;
  String get systemTheme =>
      _localizedValues[locale.languageCode]!['system_theme']!;
  String get chinese => _localizedValues[locale.languageCode]!['chinese']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['zh', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
