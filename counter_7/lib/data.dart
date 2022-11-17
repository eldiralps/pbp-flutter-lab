import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    final listBudget = ListBudget.daftarBudget;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Data Budget'),
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: listBudget.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(listBudget[index].getJudul),
                          Expanded(child: Container()),
                          Text(listBudget[index].getTanggal)
                        ]),
                    subtitle: Text(listBudget[index].getNominal),
                    trailing: Text(listBudget[index].getJenis),
                  ),
                ));
          },
        ));
  }
}
