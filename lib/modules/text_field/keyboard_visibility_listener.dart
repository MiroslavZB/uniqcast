import 'package:flutter/material.dart';

class KeyboardVisibilityListener extends StatefulWidget {
  final Widget child;
  final void Function(bool isKeyboardVisible) listener;

  const KeyboardVisibilityListener({
    super.key,
    required this.child,
    required this.listener,
  });

  @override
  KeyboardVisibilityListenerState createState() => KeyboardVisibilityListenerState();
}

class KeyboardVisibilityListenerState extends State<KeyboardVisibilityListener> with WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      _isKeyboardVisible = newValue;
      widget.listener(_isKeyboardVisible);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
