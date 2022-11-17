import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String jenisBudget = "Pengeluaran";
  List<String> listPilihJenis = ['Pengeluaran', 'Pemasukan'];
  String tanggal = "";
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: MyDrawer(),
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
                      }),
                ),
                ListTile(
                  leading: const Icon(Icons.money_off),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: jenisBudget,
                    icon: const Icon(Icons.keyboard_arrow_down),
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
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      //hintText: "Tanggal",
                      labelText: "Tanggal",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: () async {
                      showDate(context: context);
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal tidak boleh kosong!';
                      }
                      return null;
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
                        // Budget newData =
                        addBudget(
                            '$_judul', '$_nominal', '$jenisBudget', '$tanggal');
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
                                    Center(child: Text('Tanggal: $tanggal')),
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

  Future<Function()?> showDate({required BuildContext context}) async {
    _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2030),
      lastDate: DateTime(2010),
    );
    if (_date != null) {
      tanggal = _date.toString();
    }
    return null;
  }
}

class Budget {
  String judul = "";
  String nominal = "";
  String jenisBudget = "";
  String tanggal = "";

  Budget({
    required this.judul,
    required this.nominal,
    required this.jenisBudget,
    required this.tanggal,
  });

  String get getJudul {
    return judul;
  }

  String get getNominal {
    return nominal;
  }

  String get getJenis {
    return jenisBudget;
  }

  String get getTanggal {
    return tanggal;
  }
}

class ListBudget {
  static List<Budget> daftarBudget = [];
  void addBudget(Budget newBudget) {
    daftarBudget.add(newBudget);
  }

  List<Budget> get getListBudget {
    return daftarBudget;
  }
}

void addBudget(
    String judul, String nominal, String jenisBudget, String tanggal) {
  ListBudget.daftarBudget.add(Budget(
      judul: judul,
      nominal: nominal,
      jenisBudget: jenisBudget,
      tanggal: tanggal));
}
