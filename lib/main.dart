import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'theme.dart';
import 'screens/root_shell.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => const ReadRouletteApp(),
    ),
  );
}

class ReadRouletteApp extends StatelessWidget {
  const ReadRouletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadRoulette',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      useInheritedMediaQuery: true, 
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const RootShell(),
    );
  }
}
