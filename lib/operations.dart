import 'dart:math' as matematicas;

class Operator {
  // Donde se guarda la info del user
  List<double> _operations;
  List<double> get operations => _operations;
  String _editar;
  // Lo que está escribiendo el usuario
  String get editar => _editar;
  bool get isEditing => _editar != null;

// Array vacío
  Operator() : _operations = [];

  void doOperation(String operador) {
    bool isDigit = "0123456789".split("").contains(operador);
    if (isDigit) {
      if (_editar == null) {
        _editar = operador;
      } else {
        _editar = _editar + operador;
      }
    } else {
      switch (operador) {
        case "C":
          _operations.clear();
          _editar = null;
          break;
        case "↲":
          _operations.add(double.parse(_editar));
          _editar = null;
          break;
        case "+":
          double operator1 = _operations.removeLast();
          double operator2 = _operations.removeLast();
          double result;
          result = operator1 + operator2;
          _operations.add(result);
          break;
        case "-":
          double operator1 = _operations.removeLast();
          double operator2 = _operations.removeLast();
          double result;
          result = operator1 - operator2;
          _operations.add(result);
          break;
        case "x":
          double operator1 = _operations.removeLast();
          double operator2 = _operations.removeLast();
          double result;
          result = operator1 * operator2;
          _operations.add(result);
          break;
        case "/":
          double operator1 = _operations.removeLast();
          double operator2 = _operations.removeLast();
          double result;
          result = operator1 / operator2;
          _operations.add(result);
          break;
        case "±":
          double operator1 = _operations.removeLast();
          _operations.add(operator1 * (-1));
          break;
        case "√":
          double operator1 = _operations.removeLast();
          _operations.add(matematicas.sqrt(operator1));
          break;
        case ".":
          if (!_editar.contains(".")) {
            _editar = _editar + ".";
          }
          break;
        case "←":
          _editar = _editar.substring(0, _editar.length - 1);
          break;
      }
    }
  }
}
