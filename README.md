# pbp-flutter-lab

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya!
Widget memiliki dua tipe yaitu Stateful dan Stateless. Stateless widget adalah widget statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal, sehingga Stateless Widget yang tidak dapat dirubah atau tidak akan pernah berubah. Sementara itu, Stateful widget berlaku sebaliknya dimana sifatnya adalah dinamis, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data. Pada stateless widget, kita tidak dapat menggunakan fungsi setState() karena apabila memanggil fungsi setState() di stateless widget maka akan muncul pesan error. Sebaliknya, pada stateful widget, kita dapat mengubah-ubah data yang ada di dalamnya dengan menggunakan fungsi setState(). Jadi, jika kita ingin membuat komponen sederhana dan bersifat statis maka cukup gunakan stateless Widget. Akan tetapi, apabila program kita membutuhkan komponen yang dinamis maka gunakan stateful widget.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya!
- `Scaffold` : merupakan class di flutter yang menyediakan banyak widget atau bisa kita sebut API seperti Drawer, SnackBar, BottomNavigationBar, FloatingActionButton, AppBar
- `Text` : merupakan widget di Flutter yang memungkinkan kita menampilkan string teks dengan satu baris di aplikasi kita
- `Container` : merupakan widget induk yang dapat berisi beberapa widget anak dan mengelolanya secara efisien melalui lebar, tinggi, padding, warna latar belakang, dll
- `AppBar` : merupakan widget utama dalam aplikasi Android yang berada di bagian atas aplikasi dan menampilkan judul, ikon utama, widget bilah alat, dan tindakan
- `Expanded` : merupakan sebuah widget yang memperluas anak dari Row, Column atau flex sehingga mengisi ruang yang tersedia
- `Row` dan `Column` : dua widget penting di Flutter yang memungkinkan pengembang untuk menyelaraskan anak-anak secara horizontal dan vertikal sesuai dengan kebutuhan kita
- `Center` : Sebuah widget yang memusatkan anaknya di dalam dirinya sendiri
- `FloatingActionButton` : adalah jenis widget tombol paling unik yang disediakan di flutter karena dapat mengapung di layar di atas widget lain

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut!
Secara sederhana state adalah informasi dari StatefulWidget. Setiap StatefulWidget memiliki State Object. State object ini akan melacak variabel dan fungsi yang kita definisikan di dalam StatefulWidget.
Untuk memberitahu StatefulWidget bahwa ada object yang berubah pada state, kita akan menggunakan fungsi yang disebut setState().  Fungsi setState(), kita akan melalukan build ulang pada widget yang memanggil fungsi tersebut. Dengan demikian, kita tidak perlu memanggil fungsi setState() setiap kali kita mengubah variabel, kita memanggil setState() hanya jika kita ingin perubahan dalam variabel tercermin pada UI layar. Variabel yang dapat terdampak dengan fungsi tersebut adalah variabel yang berada di dalam suatu State tersebut (local variabel).

## Jelaskan perbedaan antara const dengan final!
`final` dan `const` merupakan keyword yang dapat digunakan untuk membuat variabel yang bersifat immutable. Perbedaan utama antara `final` dan `const` variabel ada pada inialisasi nilai (pemberian nilai) dari variabelnya, `const` mengharuskan variabel harus dinialisasi pada saat kompilasi, nilai bersifat konstan dan secara langsung/eksplisit sehingga pada saat kompilasi variabel `const` sudah memiliki nilai, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung/eskplisit pada saat kompilasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas!
- Generate proyek Flutter dengan perintah flutter create counter_7 dan masuk ke dalam direktori proyek dengan command cd counter_7.
- Melakukan import 'package:flutter/material.dart', membuat fungsi main(), dan membuat class-class yang mendukung app counter_7 yang meng-extends StatefulWidget ataupun StatelessWidget.
- Membuat local variabel _counter, fungsi increment dan decrement counter. 
- Membuat fungsi changetText() yang akan mengubah text GANJIL / GENAP sesuai ketentuan soal.
- Menambahkan komponen di dalam StatefulWidget yakni Text yang menampilkan return dari fungsi changeText(), nilai dari variabel _counter, dan FloatingActionButton yang terdiri dari button `-` dan `+` beserta actionsnya, dan menambahkan widget Expanded untuk memberikan space antara kedua button.
- Menambahkan variabel positive yang bertipe boolean sebagai parameter apakah _counter bernilai 0 atau tidak.
- Memberikan conditional statement pada Floating button `-` sesuai dengan ketentuan soal bonus.
