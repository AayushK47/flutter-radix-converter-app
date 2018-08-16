import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController textfieldController = new TextEditingController(text: '');
  String op = '';

  void toBinary(){
    setState(() {
      String bin = '';
      int num = int.parse(textfieldController.text);
      while(num>0){
        int rem = num%2;
        bin = bin + rem.toString();
        num = num~/2;
      }
      op = bin.split('').reversed.join();
    });
  }

  void toOctal(){
    setState(() {
      String oct = '';
      int num = int.parse(textfieldController.text);
      while(num>0){
        int rem = num%8;
        oct = oct + rem.toString();
        num = num~/8;
      }
      op = oct.split('').reversed.join();
    });
  }

  void toDecimal(){
    setState((){
      op = textfieldController.text;
    });
  }
  void toHexadecimal(){
    setState((){
      String hex = '';
      int num = int.parse(textfieldController.text);
      while(num>0){
        int rem = num%16;
        if(rem<10)
          hex = hex + rem.toString();
        else{
          switch(rem){
            case 10:
              hex = hex + 'A';
              break;
            case 11:
              hex = hex + 'B';
              break;
            case 12:
              hex = hex + 'C';
              break;
            case 13:
              hex = hex + 'D';
              break;
            case 14:
              hex = hex + 'E';
              break;
            case 15:
              hex = hex + 'F';
              break;
          }
        }
        num = num~/16;
      }
      op = hex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Radix Converter')
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: 'Enter the number',
              ),
              controller: textfieldController,
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0)
            ),
            new Center(
              child: Text('Output: $op',
                style: new TextStyle(
                  fontSize: 20.0
                )
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new MaterialButton(
                  minWidth: 120.0,
                  child: new Text('Binary'),
                  onPressed: toBinary,
                  color: Colors.indigo,
                  textColor: Colors.white
                ),
                new MaterialButton(
                  minWidth: 120.0,
                  child: new Text('Octal'),
                  onPressed: toOctal,
                  color: Colors.indigo,
                  textColor: Colors.white
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new MaterialButton(
                  minWidth: 120.0,
                  child: new Text('Decimal'),
                  onPressed: toDecimal,
                  color: Colors.indigo,
                  textColor: Colors.white
                ),
                new MaterialButton(
                  minWidth: 120.0,
                  child: new Text('Hexadecimal'),
                  onPressed: toHexadecimal,
                  color: Colors.indigo,
                  textColor: Colors.white
                )
              ],
            ),
          ],
        )
      )
    );
  }
}