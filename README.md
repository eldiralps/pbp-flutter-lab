# pbp-flutter-lab

# TUGAS 7
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

# TUGAS 8
## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
- `Navigator.push` : Metode push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
- `Navigator.pushReplacement` : Metode push yang digunakan untuk mengganti rute navigator saat ini yang paling erat menutup context yang diberikan dengan mendorong rute yang diberikan dan kemudian membuang rute sebelumnya setelah rute baru selesai dianimasikan.
Jadi, misalnya pada halaman login, setelah user berhasil login dan masuk ke halaman dashboard, kemudian user menekan tombol back, tentu user tidak perlu untuk kembali ke halaman login lagi, Untuk menangani skenario tersebut, dapat digunakan method pushReplacement. Akan tetapi, jika user hanya ingin pindah halaman saja dan tidak ada ketentuan seperti suatu halaman diharapkan untuk tidak diakses lagi, maka dapat gunakan method push.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `Scaffold` : merupakan class di flutter yang menyediakan banyak widget atau bisa kita sebut API seperti Drawer, SnackBar, BottomNavigationBar, FloatingActionButton, AppBar
- `Text` : merupakan widget di Flutter yang memungkinkan kita menampilkan string teks dengan satu baris di aplikasi kita
- `Container` : merupakan widget induk yang dapat berisi beberapa widget anak dan mengelolanya secara efisien melalui lebar, tinggi, padding, warna latar belakang, dll
- `AppBar` : merupakan widget utama dalam aplikasi Android yang berada di bagian atas aplikasi dan menampilkan judul, ikon utama, widget bilah alat, dan tindakan
- `Row` dan `Column` : dua widget penting di Flutter yang memungkinkan pengembang untuk menyelaraskan anak-anak secara horizontal dan vertikal sesuai dengan kebutuhan kita
- `Center` : sebuah widget yang memusatkan anaknya di dalam dirinya sendiri
- `Navigator` : widget yang mengelola sekumpulan widget turunan dengan disiplin tumpukan. 
- `ListTile` : menampilkan satu row yang berisi 3 garis text sebagai title, subtitle, icons, dan additional text sebagai description. Setiap text pada ListTile bisa ditempatkan pada leading atau trailing
- `Drawer` : Material Design panel yang meluncur secara horizontal dari tepi Scaffold untuk menampilkan tautan navigasi dalam aplikasi.
- `Padding` : widget yang menyisipkan child-nya dengan padding yang diberikan
- `RoundedRectangleBorder` : border persegi panjang dengan sudut membulat
- `MainAxisAlignment` : widget yang mengatur bagaimana children-nya harus ditempatkan di sepanjang sumbu utama dalam tata letak yang fleksibel
- `EdgeInsets` : satu set offset yang tidak dapat diubah di masing-masing dari empat arah mata angin.
- `BorderRadius` : satu set jari-jari yang tidak dapat diubah untuk setiap sudut persegi panjang.
- `Form` : wadah opsional untuk mengelompokkan beberapa widget pada kolom formulir
- `SingleChildScrollView` : sebuah kotak di mana satu widget dapat digulir
- `TextInputType` : widget yang menentukan jenis informasi yang akan mengoptimalkan kontrol input teks

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onPressed: event yang terjadi ketika widget ditekan
- onTap: event yang terjadi ketika widget di-tap
- onChanged: event yang terjadi ketika widget diubah
- onSaved: event yang terjadi ketika widget disimpan

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Widget Navigator bekerja seperti tumpukan layar (stack), ia menggunakan prinsip LIFO (Last-In, First-Out). Ada dua method yang dapat digunakan pada Navigator widget yaitu :
- Navigator.push (): Metode push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
- Navigator.pop (): Metode pop menghapus rute paling atas dari tumpukan. Ini menampilkan halaman sebelumnya kepada pengguna.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- membuat file baru bernama form.dart (sebagai screen form budget)
- membuat drawer navigator pada setiap halamannya (pada file main.dart dan form.dart) 
- pada parameter body pada widget build pada file form.dart, buat form dengan input berupa TextFormField (String) untuk input judul, TextFormField (int) untuk input nominal, dan DropdownButton sebagai input jenis budget (pemasukan/pengeluaran)
- menambahkan TextButton Simpan dan menambahkan event onPressed sehingga ketika user klik button simpan, data di form akan tersimpan ke variabel
- variabel List dari setiap data yang sudah diinputkan pada form sebelumnya kemudian di passing sebagai argumen pada screen yang akan menampilkan keseluruhan budget yang sudah didaftarkan 
- membuat file baru bernama data.dart (sebagai screen data budget)
- membuat drawer dan navigator yang me-route-kan ke wiget form page dan home page (counter_7)
- pada bagian Widget build, tepatnya pada bagian body, gunakan widget ListTile untuk menampilkan keseluruhan budget yang sudah pernah didaftarkan
- import masing-masing file ke file lainnya agar widget yang berada dalam file tersebut bisa saling berkesimabungan


# TUGAS 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Tidak bisa, karena sebelum melakukan pemanggilan web service, kita perlu mendefinisikan model yang kita gunakan ketika melakukan pemanggilan web service, pendefinisian model dilakukan untuk merepresentasikan response dari pemanggilan web service.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `ListTile` : menampilkan satu row yang berisi 3 garis text sebagai title, subtitle, icons, dan additional text sebagai description. Setiap text pada ListTile bisa ditempatkan pada leading atau trailing
- `FutureBuilder`: widget yang dibuat sendiri berdasarkan cuplikan interaksi terbaru pada future.
- `Card`: widget yang menunjukkan informasi album dan dua tindakan (berbentu seperti card).
- `CircularProgressIndicator`: sebuah widget yang menunjukkan kemajuan sepanjang lingkaran (loading).

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
- Menambahkan dependency http ke proyek, dependency ini digunakan untuk bertukar data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain.
- Membuat model sesuai dengan respons dari data yang berasal dari web service tersebut.
- Membuat http request ke web service menggunakan dependency http.
- Mengkonversikan objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.
- Menampilkan data yang telah dikonversi ke aplikasi dengan FutureBuilder

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist. Pada file drawer.dart, tambahkan 1 buah navigator tambahan yang mengarah pada  MyWatchlistPage. 
- Membuat satu file dart yang berisi model mywatchlist. Untuk mendapatkan model mywatchlist, pergi ke url proyek tugas 3 (tampilan JSON), kemudian copy dan convert menggunakan Quicktype. Selanjutnya, salin model tersebut ke dalam file baru watchlist.dart
- Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya (Tugas 3). Pada tahap ini, buat file watchlist_page.dart pada folder page, kemudian buat stateful widget dan buat fungsi fetchWatchlist() yang akan melakukan fetch data dari url proyek django yang dideklarasikan. Kemudian, pada wigdet build khususnya pada bagian body, tambahkan FutureBuilder yang akan menampilkan setiap atribut dari model watchlist.
- Membuat navigasi dari setiap judul watch list ke halaman detail. Tambahkan event `onTap()` yang berisikan navigator yang akan me-routing ke halaman detail, lakukan pula passing data dari setiap data yang sudah didapatkan dari fetch data sebelumnya ke page DetailMyWatchlistPage.
- Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Pada tahap ini, buat file detail_watchlist.dart yang akan menampilkan data dari web yang sudah di passing sebelumnya. Kemudian tambahkan pula `ElevatedButton` "Back" pada bagian bawah halaman DetailMyWatchlistPage.
- Menambahkan tombol untuk kembali ke daftar mywatchlist. Pada bagian ini, tombol back yang sudah dibuat sebelumnya kita beri navigator dengan fungsi pop() sehingga akan kembali ke halaman sebelumnya.
