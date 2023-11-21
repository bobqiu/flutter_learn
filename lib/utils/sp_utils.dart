import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  SpUtils._internal();

  factory SpUtils() => _instance;

  static late final SpUtils _instance = SpUtils._internal();

  static late SharedPreferences _preferences;

  static Future<SpUtils> getInstance() async {
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
  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
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
    } catch (e) {
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

/*
/// shared_preferences缓存插件方法封装
class SpUtils {
  static SpUtils? _singleton;
  static SharedPreferences? _prefs;
  static final Lock _lock = Lock();

  /// 初始化SharedPreferences缓存对象
  static Future<SpUtils> getInstance() async {
    await _lock.synchronized(() async {
      if (_prefs == null) {
        _singleton = SpUtils._();
        _prefs = await SharedPreferences.getInstance();
      }
    });
    return _singleton as SpUtils;
  }

  SpUtils._();

  /// 设置变量到缓存中去，返回设置缓存结果，true成功，false失败。
  /// 支持String、int、double、bool类型，
  static Future<bool> setData<T>(String key, T value) async {
    if (_prefs == null) await getInstance();
    bool? resData = false;
    switch (value.runtimeType) {
      case String:
        resData = await _prefs?.setString(key, value as String);
        break;
      case bool:
        resData = await _prefs?.setBool(key, value as bool);
        break;
      case int:
        resData = await _prefs?.setInt(key, value as int);
        break;
      case double:
        resData = await _prefs?.setDouble(key, value as double);
        break;
      default:
    }
    return resData as bool;
  }

  /// 设置list类型到缓存中去
  ///
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  static Future<bool> setListData<T>(String key, List<T> value,
      {bool cast = false}) async {
    if (_prefs == null) await getInstance();
    List<String> _dataList = value.map((v) {
      return cast ? v.toString() : json.encode(v);
    }).toList();
    return await _prefs?.setStringList(key, _dataList) as bool;
  }

  /// 设置Map类型到缓存中去,
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  static Future<bool> setMapData<T>(String key, T value,
      {bool cast = false}) async {
    if (_prefs == null) await getInstance();
    String newValue = cast ? value.toString() : json.encode(value);
    return await _prefs?.setString(key, newValue) as bool;
  }

  /// 获取缓存数据，只能获取常规类型，如需要获取复杂类型，使用自定义获取缓存结构类型的方法。
  ///
  /// [defValue] 自定获取key时的默认值，当为空null时，会返回你自定义的默认值
  static Future<T> getData<T>(String key, {T? defValue}) async {
    if (_prefs == null) await getInstance();
    T resData;
    switch (T) {
      case String:
        resData = (_prefs?.getString(key) ?? defValue) as T;
        break;
      case bool:
        resData = (_prefs?.getBool(key) ?? defValue) as T;
        break;
      case int:
        resData = (_prefs?.getInt(key) ?? defValue) as T;
        break;
      case double:
        resData = (_prefs?.getDouble(key) ?? defValue) as T;
        break;
      default:
        resData = await getDynamic(key, defValue: defValue) as T;
    }
    return resData;
  }

  /// 获取Map类型缓存，内部类型未定义
  static Future<T> getMap<T>(String key, {T? defValue}) async {
    if (_prefs == null) await getInstance();
    String _data = _prefs?.getString(key) ?? '';
    if (_data.isNotEmpty) return json.decode(_data) as T;
    return defValue ?? {} as T;
  }

  /// 获取自定义的Map类型数据
  /// 第二参数Fn自定义转换结果，，并返回类型
  static Future<T> getMapCustom<T>(String key, T Function(Object v) f) async {
    if (_prefs == null) await getInstance();
    Object mapData = getMap(key);
    return f(mapData);
  }

  /// 获取普通的List<Map>类型
  static Future<List<T>> getList<T>(String key, {List<T>? defValue}) async {
    if (_prefs == null) await getInstance();
    List<String> dataList =
    (_prefs?.getStringList(key) ?? defValue ?? []) as List<String>;
    return dataList.map((value) {
      T _dataMap = json.decode(value) as T;
      return _dataMap;
    }).toList();
  }

  /// 获取自定义的List类型的数据
  /// 第二参数Fn自定义转换结果，并返回类型
  static Future<List<T>> getListCustom<T>(String key, T Function(T v) f,
      {List<T>? defValue}) async {
    if (_prefs == null) await getInstance();
    List<T> list = await getList<T>(key, defValue: defValue);
    list = list.map((value) => f(value)).toList();
    return list;
  }

  /// 获取缓存数据，返回dynamic类型
  static Future<dynamic> getDynamic(String key, {Object? defValue}) async {
    if (_prefs == null) await getInstance();
    return _prefs?.get(key) ?? defValue;
  }

  /// 获取所有Key
  static Future<Set<String>> getKeys() async {
    if (_prefs == null) await getInstance();
    return _prefs?.getKeys() as Set<String>;
  }

  /// 查找是否有指定key
  static Future<bool> hasKey(String key) async {
    if (_prefs == null) await getInstance();
    return _prefs?.getKeys().contains(key) as bool;
  }

  /// 移除指定key缓存
  static Future<bool> remove(String key) async {
    if (_prefs == null) await getInstance();
    return _prefs?.remove(key) as bool;
  }

  /// 清空所有缓存
  static Future<bool> clear() async {
    if (_prefs == null) await getInstance();
    return _prefs?.clear() as bool;
  }

  /// 重新加载缓存数据
  static Future<void> reload() async {
    if (_prefs == null) await getInstance();
    _prefs?.reload();
  }
}*/
