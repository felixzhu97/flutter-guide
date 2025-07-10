import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService? _instance;
  static SharedPreferences? _prefs;

  StorageService._internal();

  factory StorageService() {
    _instance ??= StorageService._internal();
    return _instance!;
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 字符串存储
  Future<bool> setString(String key, String value) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // 整数存储
  Future<bool> setInt(String key, int value) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  // 布尔值存储
  Future<bool> setBool(String key, bool value) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  // 双精度浮点数存储
  Future<bool> setDouble(String key, double value) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  // 字符串列表存储
  Future<bool> setStringList(String key, List<String> value) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  // JSON对象存储
  Future<bool> setJson(String key, Map<String, dynamic> value) async {
    final jsonString = json.encode(value);
    return await setString(key, jsonString);
  }

  Map<String, dynamic>? getJson(String key) {
    final jsonString = getString(key);
    if (jsonString != null) {
      try {
        return json.decode(jsonString);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // JSON数组存储
  Future<bool> setJsonList(String key, List<Map<String, dynamic>> value) async {
    final jsonString = json.encode(value);
    return await setString(key, jsonString);
  }

  List<Map<String, dynamic>>? getJsonList(String key) {
    final jsonString = getString(key);
    if (jsonString != null) {
      try {
        final List<dynamic> decoded = json.decode(jsonString);
        return decoded.cast<Map<String, dynamic>>();
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // 删除键值对
  Future<bool> remove(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.remove(key);
  }

  // 清空所有数据
  Future<bool> clear() async {
    _prefs ??= await SharedPreferences.getInstance();
    return await _prefs!.clear();
  }

  // 检查键是否存在
  bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }

  // 获取所有键
  Set<String> getKeys() {
    return _prefs?.getKeys() ?? <String>{};
  }
}
