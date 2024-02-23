import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Informações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfoForm(),
    );
  }
}

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  String? _selectedSex;
  String? _selectedStatus;

  void _handleSexChange(String? value) {
    setState(() {
      _selectedSex = value;
    });
  }

  void _handleStatusChange(String? value) {
    setState(() {
      _selectedStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Informações do Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sexo:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Radio<String>(
                  value: 'Masculino',
                  groupValue: _selectedSex,
                  onChanged: _handleSexChange,
                ),
                Text('Masculino'),
                Radio<String>(
                  value: 'Feminino',
                  groupValue: _selectedSex,
                  onChanged: _handleSexChange,
                ),
                Text('Feminino'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Estado Civil:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Radio<String>(
                  value: 'Solteiro(a)',
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChange,
                ),
                Text('Solteiro(a)'),
                Radio<String>(
                  value: 'Casado(a)',
                  groupValue: _selectedStatus,
                  onChanged: _handleStatusChange,
                ),
                Text('Casado(a)'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode processar os dados coletados
                print('Sexo selecionado: $_selectedSex');
                print('Estado Civil selecionado: $_selectedStatus');
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
