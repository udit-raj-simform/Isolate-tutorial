import 'package:isolate_tutorial/util/exceptions.dart';
import 'package:isolate_tutorial/util/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  File? _image;
  final imagePicker = ImagePicker();

  Future<void> getImage() async {
    debugPrint("waiting to receive image");
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
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
                  onPressed: () {
                    ExceptionHandling().functionUsingTryCatch();
                    getImage();
                  },
                  child: const Text("Open Camera"),
                ),
              ],
            )),
      ),
    );
  }
}



