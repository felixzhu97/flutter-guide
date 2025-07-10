class AppConstants {
  static const String appName = 'Flutter技术入门与实践';
  static const String appVersion = '1.0.0';

  // API相关常量
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';
  static const String usersEndpoint = '/users';
  static const String commentsEndpoint = '/comments';

  // 本地存储键
  static const String themeKey = 'theme_mode';
  static const String localeKey = 'locale';
  static const String userKey = 'user_data';
  static const String todoKey = 'todo_list';

  // 动画持续时间
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 600);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);

  // 边距和间距
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // 圆角半径
  static const double defaultRadius = 8.0;
  static const double smallRadius = 4.0;
  static const double largeRadius = 16.0;

  // 图片相关
  static const String defaultAvatarUrl = 'https://via.placeholder.com/150';
  static const String placeholderImageUrl =
      'https://via.placeholder.com/300x200';

  // 错误消息
  static const String networkErrorMessage = '网络连接失败，请检查网络设置';
  static const String unknownErrorMessage = '未知错误，请稍后重试';
  static const String noDataMessage = '暂无数据';

  // 成功消息
  static const String saveSuccessMessage = '保存成功';
  static const String deleteSuccessMessage = '删除成功';
  static const String updateSuccessMessage = '更新成功';
}
