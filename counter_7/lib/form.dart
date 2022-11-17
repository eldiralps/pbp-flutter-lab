import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/data.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String jenisBudget = '';
  List<String> listPilihJenis = ['Pengeluaran', 'Pemasukan'];
  List<Budget> daftarBudget = [];

  List<String> listJudulTerdaftar = [];
  List<String> listNominalTerdaftar = [];
  List<String> listJenisTerdaftar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul",
                      labelText: "Judul",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      labelText: "Nominal",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nominal = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                    // Menambahkan behavior saat nominal diketik
                    //value: _nominal;
                    // onChanged: (value) {
                    //   if (value != null) {
                    //     setState(() {
                    //       _nominal = int.parse(value);
                    //     });
                    //   }
                    // },
                    // // Menambahkan behavior saat data disimpan
                    // onSaved: (String? value) {
                    //   setState(() {
                    //     _judul = value!;
                    //   });
                    // },
                    // // Validator sebagai validasi form
                    // validator: (int value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Judul tidak boleh kosong!';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: jenisBudget,
                    items: listPilihJenis.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisBudget = newValue!;
                      });
                    },
                  ),
                ),
                TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Budget newData = new Budget('$_judul', '${_nominal.toStringAsFixed(0)}', jenisBudget);
                        listJudulTerdaftar.add('$_judul');
                        listNominalTerdaftar.add('$_nominal');
                        listJenisTerdaftar.add('$jenisBudget');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(
                                        child: const Text('Informasi Budget')),
                                    SizedBox(height: 20),
                                    // Munculkan informasi yang didapat dari form
                                    Center(child: Text('Judul: $_judul')),
                                    Center(child: Text('Nominal: $_nominal')),
                                    Center(
                                        child:
                                            Text('Jenis Budget: $jenisBudget')),
                                    SizedBox(height: 7),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Kembali'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Budget {
  String judul = "";
  int nominal = 0;
  String jenisBudget = "";

  Budget(String judul, int nominal, String jenis) {
    this.judul = judul;
    this.nominal = nominal;
    this.jenisBudget = jenis;
  }
  // getJudul()

}
