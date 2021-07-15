import 'package:abpgasmed/pages/quiz_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;

  String hospital;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ABPGásMed",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.green.shade300,
      body: Center(
          child: Container(
        width: 350,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset('assets/android_icon.png'),
            Text(
              'ABPGásMed',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                onChanged: (text) {
                  name = text;
                  print(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Hospital',
                ),
                onChanged: (text) {
                  hospital = text;
                  print(hospital);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedButton(
                child: Text(
                  'Começar Quiz',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade300),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QuizPage(name: name, hospital: hospital)),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
