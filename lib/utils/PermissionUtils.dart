import 'package:permission_handler/permission_handler.dart';

/// 权限申请相关方法
class PermissionUtils {
  /// 基础权限申请
  static Future<void> initPermissions() async {
    if (await Permission.contacts.request().isGranted) return;

    await [
      Permission.storage,
      Permission.camera,
    ].request();
  }

  /// 存储权限申请
  static Future<bool> storagePerm() async {
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      final statuses = await [Permission.storage].request();
      return statuses[Permission.storage] == PermissionStatus.granted;
    }
    return true;
  }

/*  void requestPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      //权限未获得
      print("权限未获得，开始请求权限");
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      if (statuses[Permission.location] == PermissionStatus.granted) {
        //定位权限获取
        print("定位权限已获取");
      } else if (statuses[Permission.location] == PermissionStatus.denied) {
        //定位权限被拒绝
        print("定位权限被拒绝");
      }
    } else {
      //权限已获得
      print("权限已获得");
    }*/

  /// 相册权限申请
  static Future<bool> cameraPerm() async {
    PermissionStatus status = await Permission.camera.status;
    if (status != PermissionStatus.granted) {
      final statuses = await [Permission.camera].request(); // 请求权限
      return statuses[Permission.camera] == PermissionStatus.granted;
    }
    return true;
  }
}


///请求权限
/*
Future<bool> requestPermission() async {
  bool isMore13 = await SystemUtil.isMoreAndroid13();
  bool storagePermission = isMore13 ? true : await Permission.storage.isGranted;
  bool manageExternal = isMore13 ? await Permission.manageExternalStorage.isGranted : true;

  if (!storagePermission) {
    storagePermission = await Permission.storage.request().isGranted;
  }

  if (!manageExternal) {
    manageExternal = await Permission.manageExternalStorage.request().isGranted;
  }

  bool isPermissionGranted = storagePermission && manageExternal;

  if (isPermissionGranted) {
    return true;
  } else {
    return false;
  }
}*/
