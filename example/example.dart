import 'package:flutter/material.dart';
import 'package:network_aware_package/network_aware_package.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NetworkService.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NetworkAwareBuilder(
        builder: (context, isOnline) {
          return Scaffold(
            appBar: AppBar(title: Text("Network Aware")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OfflineBanner(),
                SizedBox(height: 40),
                NetworkButton(
                  child: Text("Try Action"),
                  onPressed: () => print("Action executed"),
                ),
                Text(isOnline ? "Online" : "Offline"),
              ],
            ),
          );
        },
      ),
    );
  }
}
