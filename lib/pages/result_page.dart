import 'package:flutter/material.dart';

class Conformidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Percentual de Conformidades'),
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
                    'Hospital Universitário',
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
                    semanticsValue: '50.3%',
                    semanticsLabel: 'Conformidades',
                    strokeWidth: 60,
                    value: 0.58, // receber porcentagem da pg anterior
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Icon(Icons.dangerous),
                    Text(
                      'Verificar inconformidades',
                      style: TextStyle(height: 1, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Row(),
            Row(),
          ],
        ));
  }
}
