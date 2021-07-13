import 'package:flutter/material.dart';

class Conformidade extends StatelessWidget {
  final double value;

  Conformidade({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Percentual de Conformidades '),
          centerTitle: true,
          elevation: 0.0,
        ),
        backgroundColor: Colors.green.shade300,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Hospital Universitário",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    semanticsValue: value.toString(),
                    semanticsLabel: 'Conformidades',
                    strokeWidth: 40,
                    value: value, // receber porcentagem da pg anterior
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.dangerous),
                      Text(
                        'Verificar inconformidades',
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 1, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.auto_graph),
                      Text(
                        'Evolução',
                        textAlign: TextAlign.start,
                        style: TextStyle(height: 1, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
