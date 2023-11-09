/// 状态枚举类
enum ViewState {
  loading, ///加载中
  success, ///数据返回成功
  empty, /// 空数据
  error, ///数据返回失败
  noNetwork, /// no net
}

class ViewStateError {
  Error error;
  String message;

  ViewStateError({required this.error, required this.message}) {
    this.message ??= '服务器异常';
  }
}