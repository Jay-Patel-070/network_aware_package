import 'package:flutter/widgets.dart';
import 'network_service.dart';

class NetworkAwareBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isOnline) builder;

  const NetworkAwareBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: NetworkService.instance.stream,
      initialData: true,
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? true;
        return builder(context, isOnline);
      },
    );
  }
}
