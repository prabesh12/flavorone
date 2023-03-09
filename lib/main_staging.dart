import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() async {
  AppConfig devAppConfig = AppConfig(flavor: 'stag');
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}