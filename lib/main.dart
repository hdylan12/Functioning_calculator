import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SignInScreen(),
    SignUpScreen(),
    CalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after an item is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign In'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Sign Up'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle sign in action
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle sign up action
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _result = '';
  String _operator = '';
  double _firstOperand = 0;
  double _secondOperand = 0;
  bool _operatorSet = false;
  bool _equalsPressedLast = false;

  void _buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _display = '0';
        _result = '';
        _operator = '';
        _firstOperand = 0;
        _secondOperand = 0;
        _operatorSet = false;
        _equalsPressedLast = false;
      } else if (text == '+' || text == '-' || text == '*' || text == '/') {
        if (!_operatorSet || _equalsPressedLast) {
          _firstOperand = double.parse(_display);
          _operator = text;
          _display = '0';
          _operatorSet = true;
          _equalsPressedLast = false;
        }
      } else if (text == '=') {
        if (_operatorSet) {
          if (!_equalsPressedLast) {
            _secondOperand = double.parse(_display);
            _equalsPressedLast = true;
          }

          switch (_operator) {
            case '+':
              _result = (_firstOperand + _secondOperand).toString();
              break;
            case '-':
              _result = (_firstOperand - _secondOperand).toString();
              break;
            case '*':
              _result = (_firstOperand * _secondOperand).toString();
              break;
            case '/':
              _result = (_firstOperand / _secondOperand).toString();
              break;
          }

          // Format the result to remove trailing ".0" if it is an integer
          if (_result.endsWith('.0')) {
            _result = _result.substring(0, _result.length - 2);
          }

          _display = _result;
          _firstOperand = double.parse(_result);
        }
      } else {
        if (_display == '0' || _equalsPressedLast) {
          _display = text;
          _equalsPressedLast = false;
        } else {
          _display += text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display area
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                _display,
                style: TextStyle(fontSize: 48),
              ),
            ),
            SizedBox(height: 16),
            // Button rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('7', onPressed: _buttonPressed),
                RoundCalculatorButton('8', onPressed: _buttonPressed),
                RoundCalculatorButton('9', onPressed: _buttonPressed),
                RoundCalculatorButton('C', backgroundColor: Colors.red, onPressed: _buttonPressed),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('4', onPressed: _buttonPressed),
                RoundCalculatorButton('5', onPressed: _buttonPressed),
                RoundCalculatorButton('6', onPressed: _buttonPressed),
                RoundCalculatorButton('*', backgroundColor: Colors.blue, onPressed: _buttonPressed),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('1', onPressed: _buttonPressed),
                RoundCalculatorButton('2', onPressed: _buttonPressed),
                RoundCalculatorButton('3', onPressed: _buttonPressed),
                RoundCalculatorButton('-', backgroundColor: Colors.blue, onPressed: _buttonPressed),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundCalculatorButton('0', onPressed: _buttonPressed),
                RoundCalculatorButton('.', backgroundColor: Colors.blue, onPressed: _buttonPressed),
                RoundCalculatorButton('=', backgroundColor: Colors.blue, onPressed: _buttonPressed),
                RoundCalculatorButton('+', backgroundColor: Colors.blue, onPressed: _buttonPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundCalculatorButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final void Function(String) onPressed;

  RoundCalculatorButton(this.text, {this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.grey[300],
        padding: EdgeInsets.all(20),
        minimumSize: Size(80, 80),
        shape: CircleBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
