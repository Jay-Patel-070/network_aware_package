import 'package:flutter/material.dart';
import 'network_builder.dart';

class NetworkButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const NetworkButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NetworkAwareBuilder(
      builder: (context, isOnline) {
        return ElevatedButton(
          onPressed: isOnline ? onPressed : null,
          child: child,
        );
      },
    );
  }
}
