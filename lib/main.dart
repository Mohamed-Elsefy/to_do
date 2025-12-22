import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/models/task_adapter.dart';
import 'package:to_do/services/hive_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initHive();

  runApp(const MainApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TaskAdapter());
  }

  final hiveStorage = HiveStorageService();

  await hiveStorage.init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
