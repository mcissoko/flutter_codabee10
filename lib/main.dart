import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int itemSelectionne;

  List<Widget> radios(){
    List<Widget> l = [];
    for(int x = 0; x< 4; x++){
      Row row = new Row(
        children: [
          new Text( "Choix numéro ${x + 1}"),
          new Radio(
              value: x,
              groupValue: itemSelectionne,
              onChanged: (int i){
                setState(() {
                  itemSelectionne = i;
                });
              }
          )
        ],
      );
      l.add(row);
    }

    return l;
  }
  Map check = {
    'Carottes': false,
    'Bananes': false,
    'Yaourt': false,
    'Pain': false
  };

  List<Widget> checkList () {
    List<Widget> l = [];
    check.forEach((key, value) {
      Row row = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(key, style: new TextStyle(color: value ? Colors.grey : Colors.red),),
          new Checkbox(
              value: value,
              onChanged: (bool b){
                setState(() {
                  check[key] = b;
                });
              })
        ],
      );
      l.add(row);
    });

    return l;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: radios(),
        )
      ),

    );
  }
}
