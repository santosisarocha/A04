import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Faça login para acessar a calculadora',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TriangleAreaPage()),
                );
              },
              child: Text('Área do Triângulo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrapezoidAreaPage()),
                );
              },
              child: Text('Área do Trapézio'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OhmsLawPage()),
                );
              },
              child: Text('1ª Lei de Ohm'),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleAreaPage extends StatefulWidget {
  @override
  _TriangleAreaPageState createState() => _TriangleAreaPageState();
}

class _TriangleAreaPageState extends State<TriangleAreaPage> {
  TextEditingController baseController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área do Triângulo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Base'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double base = double.parse(baseController.text);
                double height = double.parse(heightController.text);
                double area = 0.5 * base * height;
                setState(() {
                  result = 'Área = $area';
                });
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}

class TrapezoidAreaPage extends StatefulWidget {
  @override
  _TrapezoidAreaPageState createState() => _TrapezoidAreaPageState();
}

class _TrapezoidAreaPageState extends State<TrapezoidAreaPage> {
  TextEditingController base1Controller = TextEditingController();
  TextEditingController base2Controller = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área do Trapézio'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: base1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Base Maior'),
            ),
            TextField(
              controller: base2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Base Menor'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double base1 = double.parse(base1Controller.text);
                double base2 = double.parse(base2Controller.text);
                double height = double.parse(heightController.text);
                double area = 0.5 * (base1 + base2) * height;
                setState(() {
                  result = 'Área = $area';
                });
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}

class OhmsLawPage extends StatefulWidget {
  @override
  _OhmsLawPageState createState() => _OhmsLawPageState();
}

class _OhmsLawPageState extends State<OhmsLawPage> {
  TextEditingController voltageController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController resistanceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1ª Lei de Ohm'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: voltageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tensão (V)'),
            ),
            TextField(
              controller: currentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Corrente (A)'),
            ),
            TextField(
              controller: resistanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Resistência (Ω)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double voltage = double.parse(voltageController.text);
                double current = double.parse(currentController.text);
                double resistance = double.parse(resistanceController.text);
                if (voltage != 0 && current != 0) {
                  double resistanceCalculated = voltage / current;
                  setState(() {
                    result = 'Resistência Calculada = $resistanceCalculated Ω';
                  });
                } else if (current != 0 && resistance != 0) {
                  double voltageCalculated = current * resistance;
                  setState(() {
                    result = 'Tensão Calculada = $voltageCalculated V';
                  });
                } else {
                  setState(() {
                    result = 'Preencha dois campos para calcular o terceiro';
                  });
                }
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}

