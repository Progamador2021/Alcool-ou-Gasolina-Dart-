import 'dart:ffi';

import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado= "Numero inválido digite um numero maior que 0 e sem virgula ";
      });
    }else{

      double resultado = (precoAlcool/precoGasolina);
      double resultadoFormatado = double.parse(resultado.toStringAsFixed(2));

        if(resultadoFormatado >= 0.7 ){
            setState(() {
              _textoResultado = "Melhor abastecer com gasolina. Resultado foi: $resultadoFormatado";

            });
        }else{
            setState(() {
              _textoResultado = "Melhor abastecer com Alcool. Resultado foi: $resultadoFormatado " ;
            });
        }
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Alcool ou Gasolina "),
        backgroundColor: Colors.blue,
      ),
    body: Container(

      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: <Widget>[
            //imagem
            Padding(padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            //texto
            Padding(padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção de combustivel para sua moto!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            //texto2
            Padding(padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Se o resultado for inferior a 0,7, use álcool. Se for maior que 0,7, então abasteça com gasolina",
                style: TextStyle(
                    fontStyle: FontStyle.italic
                ),
              ),
            ),
            //input
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço do ALCOOL, Ex: 1.22"
              ),
              style: TextStyle(
                  fontSize: 22
              ),
              //Controla os valores digitados
              controller: _controllerAlcool ,
            ),
            //input
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço do GASOLINA, Ex: 1.50"
              ),
              style: TextStyle(
                  fontSize: 22
              ),
              //Controla os valores digitados
              controller: _controllerGasolina ,
            ),
            //button
            Padding(padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: _calcular,
                child: Text("Calcular", style: TextStyle(
                    fontSize: 20
                ),),

              ),
            ),
            Center(
              child:Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            )

          ],
        ),
      )
    ),
    /*  body: Column(
        children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              child:
              Image.asset("images/logo.png"),

            ),


            Padding(padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),
              child: TextField(
                 keyboardType: TextInputType.number ,

                 decoration: InputDecoration(
                   labelText: "Qual o preço do alcool ?"
                 ),

                 onSubmitted:(String texto) {
                  print("Texto digitado:" + texto);
                 }
                ),
            ) ,
          Padding(padding: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 20),
            child: TextField(
                keyboardType: TextInputType.number ,
                decoration: InputDecoration(
                    labelText: "Qual o preço da Gasolina ?"
                ),

                onSubmitted:(String texto) {
                  print("Texto digitado:" + texto);
                }
            ),
          ) ,
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                // ação do botão aqui
              },
              child: Text('Calcular'),
            ),
          ),

        ],
      ),*/
    );
  }
}
