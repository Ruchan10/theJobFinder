import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/app.dart';
import 'package:the_job_finder/core/network/hive_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  FilePicker.platform;

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
