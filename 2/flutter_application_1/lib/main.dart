import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comidas Típicas',
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
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    FoodScreen(country: 'Brasil', food: 'Feijoada'),
    FoodScreen(country: 'Itália', food: 'Pizza'),
    FoodScreen(country: 'Japão', food: 'Sushi'),
    FoodScreen(country: 'México', food: 'Tacos'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas Típicas por País'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Brasil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Itália',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Japão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'México',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FoodScreen extends StatelessWidget {
  final String country;
  final String food;

  const FoodScreen({Key? key, required this.country, required this.food})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Comida Típica de $country:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            food,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
