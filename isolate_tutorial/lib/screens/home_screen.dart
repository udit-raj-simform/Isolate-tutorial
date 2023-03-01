import 'dart:isolate';

import 'package:isolate_tutorial/util/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _image == null
                    ? const Text("No Image Available For Preview")
                    : Image.file(_image!),
                MaterialButton(
                  onPressed: () async {
                    final receiverPort = ReceivePort();
                    int a = 5;
                    int b = 9;
                    await Isolate.spawn(getImage, [a, b, receiverPort.sendPort]);

                  },
                  child: const Text("Open Camera"),
                ),
              ],
            )),
      ),
    );
  }

  void getImage(List<Object> arguments) async {
    debugPrint("waiting to receive image");
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }
}


