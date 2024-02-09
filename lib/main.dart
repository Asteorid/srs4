import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главный экран')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorButton(color: Colors.red, buttonText: 'Красная'),
            ColorButton(color: Colors.yellow, buttonText: 'Желтая'),
            ColorButton(color: Colors.blue, buttonText: 'Синяя'),
            NavigationButton(
              buttonText: 'Push',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondPage(backgroundColor: Colors.red)));
              },
            ),
            NavigationButton(
              buttonText: 'Pop',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            NavigationButton(
              buttonText: 'Push and Remove Until',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final String buttonText;

  const ColorButton({required this.color, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(backgroundColor: color),
          ),
        );
      },
      style: ElevatedButton.styleFrom(primary: color),
      child: Text(buttonText),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const NavigationButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Color backgroundColor;

  const SecondPage({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Container(color: backgroundColor),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),
      body: Center(child: Text('This is the third page')),
    );
  }
}
