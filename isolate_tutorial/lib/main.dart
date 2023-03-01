import 'package:isolate_tutorial/util/exports.dart';

void main(List<String> args) {
  runApp(const MyApp());
  debugPrint("App has been built");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Isolate Use Example",
      theme: ThemeData(
          // primarySwatch: Colors.amberAccent,
          ),
      debugShowCheckedModeBanner: true,
      home: const HomeScreen(),
    );
  }
}
