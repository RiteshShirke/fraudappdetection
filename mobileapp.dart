// main.dart (Flutter)
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraudulent App Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Application> _apps = [];

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  void _loadApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications();
    setState(() {
      _apps = apps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fraudulent App Detector"),
      ),
      body: ListView.builder(
        itemCount: _apps.length,
        itemBuilder: (context, index) {
          Application app = _apps[index];
          return ListTile(
            title: Text(app.appName),
            subtitle: Text(app.packageName),
            onTap: () {
              // Placeholder for predicting if the app is fraudulent
              _checkApp(app);
            },
          );
        },
      ),
    );
  }

  void _checkApp(Application app) {
    // Here you would call a Python backend or ML model to predict fraud
    // This is a placeholder dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('App Check'),
        content: Text('${app.appName} is safe.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
