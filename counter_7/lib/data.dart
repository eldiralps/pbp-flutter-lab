import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';

class MyDataPage extends StatefulWidget {
  //const MyDataPage({super.key});

  List<String> listJudulTerdaftar = [];
  List<String> listNominalTerdaftar = [];
  List<String> listJenisTerdaftar = [];
  MyDataPage(
      {super.key,
      required this.listJudulTerdaftar,
      required this.listNominalTerdaftar,
      required this.listJenisTerdaftar});
  //: super(key: key);

  @override
  State<MyDataPage> createState() => _MyDataPageState(
      listJenisTerdaftar, listNominalTerdaftar, listJenisTerdaftar);
}

class _MyDataPageState extends State<MyDataPage> {
  List<String> listJudulTerdaftar = [];
  List<String> listNominalTerdaftar = [];
  List<String> listJenisTerdaftar = [];
  _MyDataPageState(this.listJudulTerdaftar, this.listNominalTerdaftar,
      this.listJenisTerdaftar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Data Budget'),
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
        body: ListView.builder(
          // //it
          // itemBuilder: (BuildContext (context, index) => Container(
          //   width:  MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.symmetric(horizontal:  10.0, vertical: 5.0),
          //   child: Card(
          //     elevation: 5.0,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(0.9)
          //     ),
          //     child: Container(
          //       width:  MediaQuery.of(context).size.width,
          //       padding: EdgeInsets.symmetric(horizontal:  10.0, vertical: 10.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Row(),
          //           Container(alignment: ,)
          //         ])
          //     ),

          //     )
          // )
          // )
          itemCount: listJudulTerdaftar.length,
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
                      children: <Widget>[Text(listJudulTerdaftar[index])],
                    ),
                    subtitle: Text(listNominalTerdaftar[index]),
                    trailing: Text(listJenisTerdaftar[index]),
                  ),
                ));
          },
        ));
  }
}
