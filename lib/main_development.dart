import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() async {
  AppConfig devAppConfig = AppConfig( flavor: 'dev');
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}