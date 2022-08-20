import 'package:calculator_app/main.dart';
import 'package:flutter/material.dart';
import 'operations.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Operator op = Operator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Icono de settings
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
            ),
            Expanded(
                //Contenedor donde está el display
                child: Container(
              margin: EdgeInsets.all(15),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0, 3))
                ],
                color: Colors.purple[200],
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 30.0,
                  left: 25.0,
                ),
                itemCount: op.operations.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  String text = "";
                  if (index < op.operations.length) {
                    text = op.operations[index].toString();
                  } else if (op.isEditing) {
                    text = "> " + op.editar;
                  }
                  return Text(
                    text,
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.purple[600],
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            )),
            Expanded(
              flex: 2,

              // Contenedor donde están los botones
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      // Botón borrar
                      if (index == 2) {
                        return buildButton(
                          buttons[index],
                          buttons[index],
                          Colors.green[400],
                          Colors.white,
                        );

                        // Botón C
                      } else if (index == 3) {
                        return buildButton(
                          buttons[index],
                          buttons[index],
                          Colors.red[700],
                          Colors.white,
                        );

                        // Demás botones
                      } else {
                        return buildButton(
                          buttons[index],
                          buttons[index],
                          isOperator(buttons[index])
                              ? Colors.deepPurple[500]
                              : Colors.grey[200],
                          isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      String operador, String buttonText, dynamic color, dynamic textColor) {
    return GestureDetector(
      onTap: () => setState(() => op.doOperation(operador)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                color: color,
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(color: textColor, fontSize: 27.0),
                  ),
                ))),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '±' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '√') {
      return true;
    }
    return false;
  }
}
