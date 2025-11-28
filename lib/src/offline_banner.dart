import 'package:flutter/material.dart';
import 'network_builder.dart';

class OfflineBanner extends StatelessWidget {
  final Widget? offlineWidget;
  final Widget? onlineWidget;

  const OfflineBanner({
    super.key,
    this.offlineWidget,
    this.onlineWidget,
  });

  @override
  Widget build(BuildContext context) {
    return NetworkAwareBuilder(
      builder: (context, isOnline) {
        if (isOnline) {
          return onlineWidget ?? SizedBox.shrink();
        }

        return offlineWidget ??
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: const Text(
                "You're offline",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
      },
    );
  }
}