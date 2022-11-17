import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        listJudulTerdaftar: [],
        listNominalTerdaftar: [],
        listJenisTerdaftar: [],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key});

  List<String> listJudulTerdaftar;
  List<String> listNominalTerdaftar;
  List<String> listJenisTerdaftar;
  MyHomePage(
      {super.key,
      required this.listJudulTerdaftar,
      required this.listNominalTerdaftar,
      required this.listJenisTerdaftar});
  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState(
      listJenisTerdaftar, listNominalTerdaftar, listJenisTerdaftar);
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listJudulTerdaftar = [];
  List<String> listNominalTerdaftar = [];
  List<String> listJenisTerdaftar = [];
  _MyHomePageState(this.listJudulTerdaftar, this.listNominalTerdaftar,
      this.listJenisTerdaftar);
  int _counter = 0;
  //String textHolder = 'Genap';
  bool positive = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    if (_counter > 0) {
      positive = true;
    } else {
      positive = false;
    }
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
      positive = true;
    }
    if (_counter == 1) {
      setState(() {
        _counter--;
      });
      positive = false;
    }
    //else {
    //positive = false;
    //}
  }

  changeText() {
    if (_counter % 2 == 1) {
      return Text(
        "GANJIL",
        style: TextStyle(color: Colors.blue),
      );
      //Text(
      //'$_counter',
      //style: Theme.of(context).textTheme.headline4,
      //);
    } else {
      return Text(
        "GENAP",
        style: TextStyle(color: Colors.red),
      );
      //Text(
      //'$_counter',
      //style: Theme.of(context).textTheme.headline4,
      //);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            listJudulTerdaftar: listJudulTerdaftar,
                            listNominalTerdaftar: listNominalTerdaftar,
                            listJenisTerdaftar: listJenisTerdaftar)),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              // TAMBAHIN 1 HALAMAN LAGII, DATA BUDGET
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDataPage(
                            listJudulTerdaftar: listJudulTerdaftar,
                            listNominalTerdaftar: listNominalTerdaftar,
                            listJenisTerdaftar: listJenisTerdaftar)),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              changeText(),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 35),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              if (positive)
                FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: _decrementCounter),
              Expanded(child: Container()),
              FloatingActionButton(
                  child: const Icon(Icons.add), onPressed: _incrementCounter),
            ])));
  }
}
