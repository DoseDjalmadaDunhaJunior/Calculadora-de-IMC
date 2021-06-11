import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HoomeState createState() => _HoomeState();
}

class _HoomeState extends State<Home> {
  dynamic kg = 0;
  dynamic alt = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoTxt = "Informe seus dados!!";

  void _reseta() {
    //setState(() {
    //kg = null;
    //alt = null;
    _infoTxt = "Informe seus dados!!";
    //});
  }

  void _calcula() {
    setState(() {
      double peso = double.parse(kg);
      double altura = (double.parse(alt)) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoTxt = "Ta muito magro, ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoTxt = "Peso Ideal, ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoTxt = "Levemente Acima do Peso, ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoTxt = "Obesidade Grau I, ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoTxt = "Obesidade Grau II, ${imc.toStringAsPrecision(4)}";
      } else if (imc > 39.9) {
        _infoTxt = "Obesodade Grau III, ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _reseta,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 120.0,
                  color: Colors.blue,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso em (Kg)",
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                  onChanged: (txt) {
                    kg = txt;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "insira seu peso";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura em (cm)",
                      labelStyle: TextStyle(color: Colors.blue)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                  onChanged: (txt) {
                    alt = txt;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "insira sua altura";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _calcula();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  _infoTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                )
              ],
            ),
          ),
        ));
  }
}
