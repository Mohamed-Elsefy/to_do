import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/models/task_adapter.dart';
import 'package:to_do/providers/task_provider.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:to_do/services/hive_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveStorage = HiveStorageService();
  await _initHive(hiveStorage);

  runApp(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(hiveStorage)],
      child: const MainApp(),
    ),
  );
}

Future<void> _initHive(HiveStorageService hiveStorage) async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TaskAdapter());
  }

  await hiveStorage.init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
