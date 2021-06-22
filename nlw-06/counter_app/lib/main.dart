
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    home: HomePage(),
    
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;

  void increment() {
    count++;
    //print(count);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Primeiro APP Contador')),
      ),
      body:
     
      Container(
       decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://i.imgur.com/vigvPbF.png"),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(top: 50.0),
        child: Center(
          
            child: Text(
          'Contador\n$count' + '\n\n\n\nTioPew',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
          
        )),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          increment();
        },
       
      ),
    
    );
  }
}

