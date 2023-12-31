import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider封装类
///
/// 方便数据初始化
/// 另外发现进一步封装,都是使用了Consumer来进行包裹, 那么这总控制会更加颗粒化的去build
class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T viewModel;
  final Widget? child;
  final Function(T model)? onModelReady;
  final bool autoDispose;

  ProviderWidget({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.child,
    this.onModelReady,
    this.autoDispose = true,
  }) : super(key: key);

  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onModelReady?.call(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class ProviderWidget2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends StatefulWidget {
  final Widget Function(BuildContext context, A model1, B model2, Widget? child)
      builder;
  final A model1;
  final B model2;
  final Widget? child;
  final Function(A model1, B model2)? onModelReady;
  final bool autoDispose;

  ProviderWidget2({
    Key? key,
    required this.builder,
    required this.model1,
    required this.model2,
    this.child,
    this.onModelReady,
    this.autoDispose = true,
  }) : super(key: key);

  _ProviderWidgetState2<A, B> createState() => _ProviderWidgetState2<A, B>();
}

class _ProviderWidgetState2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends State<ProviderWidget2<A, B>> {
  late A model1;
  late B model2;

  @override
  void initState() {
    model1 = widget.model1;
    model2 = widget.model2;
    widget.onModelReady?.call(model1, model2);
    super.initState();
  }

  @override
  void dispose() {
    if (widget != null &&
        widget.autoDispose != null &&
        widget.autoDispose == true) {
      model1.dispose();
      model2.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<A>.value(value: model1),
          ChangeNotifierProvider<B>.value(value: model2),
        ],
        child: Consumer2<A, B>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
