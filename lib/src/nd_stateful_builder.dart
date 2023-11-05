import 'package:flutter/widgets.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

class NDStatefulBuilder extends StatefulWidget {
  const NDStatefulBuilder({
    super.key,
    this.initStateHandler,
    this.didChangeDependenciesHandler,
    this.buildHandler,
    this.didUpdateWidgetHandler,
    this.deactivateHandler,
    this.disposeHandler,
  });

  @override
  State<NDStatefulBuilder> createState() => _NDStatefulBuilderState();

  final void Function(_NDStatefulBuilderState state)? initStateHandler;
  final void Function(_NDStatefulBuilderState state)?
      didChangeDependenciesHandler;
  final Widget Function(BuildContext context, StateSetter setState,
      _NDStatefulBuilderState state)? buildHandler;
  final void Function(
          NDStatefulBuilder oldWidget, _NDStatefulBuilderState state)?
      didUpdateWidgetHandler;
  final void Function(_NDStatefulBuilderState state)? deactivateHandler;
  final void Function(_NDStatefulBuilderState state)? disposeHandler;
}

class _NDStatefulBuilderState extends State<NDStatefulBuilder> {
  @override
  void initState() {
    super.initState();
    widget.initStateHandler?.call(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.didChangeDependenciesHandler?.call(this);
  }

  @override
  Widget build(BuildContext context) =>
      widget.buildHandler?.call(context, setState, this) ?? const SizedBox();

  @override
  void didUpdateWidget(covariant NDStatefulBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.didUpdateWidgetHandler?.call(oldWidget, this);
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.deactivateHandler?.call(this);
  }

  @override
  void dispose() {
    super.dispose();
    widget.disposeHandler?.call(this);
  }

  dynamic operator [](Object? key) => _props[key];
  T? get<T>(Object? key) => cast<T>(_props[key]);

  void operator []=(Object key, dynamic value) => _props[key] = value;

  // Privates
  final _props = <Object, dynamic>{};
}
