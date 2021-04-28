import 'package:daily_app/networking/SecondPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var _text = 'Default Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First screen"),
      ),
      body: Column(
        children: [
          Text(_text),
          ElevatedButton(
            onPressed: () {
              _openSecondPage();
            },
            child: Text('Go to 2nd screen'),
          ),
        ],
      ),
    );
  }

  Future _openSecondPage() async {
    final text = await Navigator.of(context).push(
      new MaterialPageRoute<String>(
          builder: (BuildContext context) {
            return SecondPage();
          },
          fullscreenDialog: true),
    );

    setState(() {
      if (text != null) {
        _text = text;
      }
    });
  }
}
