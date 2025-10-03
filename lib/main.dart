import 'package:flutter/material.dart';
import 'package:prac3/screens/ClassScreen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NameScreen(title: 'Экран выбора имени'),
    );
  }
}

class NameScreen extends StatefulWidget {
  const NameScreen({super.key, required this.title});
  final String title;

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _controller = TextEditingController();

  void toClassScreen() {
    String name = _controller.text;
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {return ClassScreen(name: name); },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Введите имя персонажа:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            SizedBox(
                width: 250,
                height: 60,
                child:TextField(controller: _controller)),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: toClassScreen,
                child: SizedBox(child: Text("Подтвердить!"),))

          ],
        )
        ),
      );
  }
}




