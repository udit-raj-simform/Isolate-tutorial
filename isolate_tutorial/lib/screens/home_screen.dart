import 'package:isolate_tutorial/util/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("App started running");
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text(
          "Camera using Isolate",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: MaterialButton(
            onPressed: () {
              debugPrint("Button has been clicked");
            },
            child: const Text("Open Camera"),
          ),
        ),
      ),
    );
  }
}
