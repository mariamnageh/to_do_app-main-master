import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:instabug_flutter/instabug_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Instabug.init(
    token: '097592fbd7f32779614900017455f668',
    invocationEvents: [
      InvocationEvent.floatingButton,
      InvocationEvent.screenshot,
      InvocationEvent.shake,
    ],
  );

  // Enable bug reporting
  BugReporting.setEnabled(true);

  // Set mode to beta & show welcome message
  Instabug.setWelcomeMessageMode(WelcomeMessageMode.beta);
  Instabug.showWelcomeMessageWithMode(WelcomeMessageMode.beta);

  ExtendedBugReportMode.enabledWithRequiredFields;
  ExtendedBugReportMode.enabledWithOptionalFields;

  BugReporting.setShakingThresholdForAndroid(800);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Instabug.setPrimaryColor(Theme.of(context).primaryColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: HomeScreen(), // Use the Home widget here, not home()
    );
  }
}
