
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class sputils{
  sputils._internal();

  factory sputils() => _instance;

  static late final sputils _instance = sputils._internal();

  static late SharedPreferences _preferences;

  static Future<sputils> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  /// 根据key存储int类型
  static Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  /// 根据key获取int类型
  static int? getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  /// 根据key存储double类型
  static Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  /// 根据key获取double类型
  static double? getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型
  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  /// 根据key获取字符串类型
  static String? getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  /// 根据key存储布尔类型
  static Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  /// 根据key获取布尔类型
  static bool? getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型数组
  static Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  static List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  static Future<bool> setMap(String key, Map value) {
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  static Map getMap(String key) {
    String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

////第二种封装方法

  /// 通用设置持久化数据
  static setLocalStorage<T>(String key, T value) {
    String type = value.runtimeType.toString();

    switch (type) {
      case "String":
        setString(key, value as String);
        break;
      case "int":
        setInt(key, value as int);
        break;
      case "bool":
        setBool(key, value as bool);
        break;
      case "double":
        setDouble(key, value as double);
        break;
      case "List<String>":
        setStringList(key, value as List<String>);
        break;
      case "_InternalLinkedHashMap<String, String>":
        setMap(key, value as Map);
        break;
    }
  }

  /// 获取持久化数据
  static dynamic getLocalStorage<T>(String key) {
    dynamic value = _preferences.get(key);
    if (value.runtimeType.toString() == "String") {
      if (_isJson(value)) {
        return json.decode(value);
      }
    }
    return value;
  }

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return _preferences.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await _preferences.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await _preferences.reload();
  }

  /// 判断是否是json字符串
  static _isJson(String value) {
    try {
      JsonDecoder().convert(value);
      return true;
    } catch(e) {
      return false;
    }
  }
}


/*
// 设置String类型
await JSpUtil.setString("name", "Jimi");

// 设置int类型
await JSpUtil.setInt("age", 18);

// 设置bool类型
await JSpUtil.setBool("isTeacher", true);

// 设置double类型
await JSpUtil.setDouble("height", 1.88);

// 设置string类型的数组
await JSpUtil.setStringList("action", ["吃饭", "睡觉", "打豆豆"]);

// 设置Map类型
await JSpUtil.setMap("weight", {"weight": 112});

JSpUtil.setLocalStorage("name", "Jimi");
JSpUtil.setLocalStorage("age", 18);
JSpUtil.setLocalStorage("isTeacher", true);
JSpUtil.setLocalStorage("height", 1.88);
JSpUtil.setLocalStorage("action", ["吃饭", "睡觉", "打豆豆"]);
JSpUtil.setLocalStorage("weight", {"weight": "112"});

JSpUtil.getLocalStorage("name");
JSpUtil.getLocalStorage("age");
JSpUtil.getLocalStorage("isTeacher");
JSpUtil.getLocalStorage("height");
JSpUtil.getLocalStorage("action");
JSpUtil.getLocalStorage("weight");


// 获取磁盘中所有存入的key
List<String> keys = JSpUtil.getKeys().toList();
print(keys);

// 持久化数据中是否包含某个key
bool isContainKey = JSpUtil.containsKey("name");
print(isContainKey);

// 删除持久化数据中某个key
bool isRemoveKey = await JSpUtil.remove("name");
print(isRemoveKey);

// 清除所有持久化数据
bool isClearAllKey = await JSpUtil.clear();
print(isClearAllKey);

// 重新加载所有数据,仅重载运行时
await JSpUtil.reload();
Text("名字: ${JSpUtil.getString("name")}",
     style: TextStyle(
       color: Colors.blue,
       fontSize: 20
     ),
    ),
SizedBox(height: 20,),
Text("年龄: ${JSpUtil.getInt("age")}",
     style: TextStyle(
       color: Colors.red,
       fontSize: 20
     ),
    ),
SizedBox(height: 20,),
Text("是老师吗?: ${JSpUtil.getBool("isTeacher")}",
     style: TextStyle(
       color: Colors.orange,
       fontSize: 20
     ),
    ),
SizedBox(height: 20,),
Text("身高: ${JSpUtil.getDouble("height")}",
     style: TextStyle(
       color: Colors.pink,
       fontSize: 20
     ),
    ),
SizedBox(height: 20,),
Text("我正在: ${JSpUtil.getStringList("action")}",
     style: TextStyle(
       color: Colors.purple,
       fontSize: 20
     ),
    ),
*/
