import 'package:flutter/material.dart';

class GlobalContext {
  /// 全局的context
  static late BuildContext _context;

  static BuildContext get context {
    assert(null != _context);
    return _context;
  }

  static set setContext(BuildContext value) {
    _context = value;
  }
}