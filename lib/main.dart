import 'package:flavorone/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() async {
//   // Load the appropriate .env file based on the current flavor
//   switch (const String.fromEnvironment('ENV')) {
//     case 'production':
//       await dotenv.load(fileName: '.env.production');
//       break;
//     case 'development':
//       await dotenv.load(fileName: '.env.development');
//       break;
//     case 'staging':
//       await dotenv.load(fileName: '.env.staging');
//       break;
//     default:
//       throw Exception('Invalid environment');
//   }

//   // Start the app
//   runApp(MyApp());
// }
Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  return MyApp(appConfig);
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;
  MyApp(this.appConfig);

  Widget flavorBanner(Widget child) {
    return Banner(
      message: appConfig.flavor,
      location: BannerLocation.topEnd,
      color: appConfig.flavor == "dev"
          ? Colors.red.withOpacity(80)
          : appConfig.flavor == "prod"
              ? Colors.blue
              : Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
