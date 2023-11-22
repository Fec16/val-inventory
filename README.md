### **Jason's Val Inventory**
---
#### Nama: Jason Kent Winata
#### NPM: 2206081313
---

<details>
<summary>Tugas 7</summary>

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
    + Stateless Widget adalah jenis widget di Flutter yang *state*-nya tidak dapat diubah setelah dibuat. Artinya, sekali dibuat, tampilan widget ini tidak dapat diubah atau diperbarui. Stateless Widget cocok untuk tampilan statis atau komponen yang tidak perlu mengikuti perubahan keadaan. Stateless Widget tidak memiliki metode `setState()`

    + Stateful Widget adalah jenis widget di Flutter yang *state*-nya dapat diubah setelah dibuat. Artinya, tampilan widget ini dapat diubah dan dapat berubah berkali-kali. Widget ini digunakan untuk menggambarkan komponen yang perlu merespons perubahan keadaan, seperti tombol yang dapat diklik atau input pengguna yang berubah. Stateful Widget memiliki metode `setState()`

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    + MyHomePage (StatelessWidget): Widget utama yang mewakili halaman beranda aplikasi. Fungsinya menampilkan semua item dan memiliki tampilan yang dapat di-*scroll*

    + MyApp (StatelessWidget): Widget utama yang digunakan untuk inisialisi aplikasi. Selain itu, untuk mengatur tema dan menentukan halaman beranda

    + ShopCard (StatelessWidget): Widget yang digunakan untuk membuat *cards* yang menampilkan setiap item. Terdiri dari icon, text, dan background color yang sesuai.

    + MaterialApp: Widget yang digunakan untuk mengkonfigurasi dan menampilkan aplikasi Flutter. Tersedia berbagai pengaturan, termasuk tema dan halaman beranda.

    + Scaffold: Widget yang memberikan kerangka dasar untuk halaman aplikasi. Mencakup komponen seperti AppBar, body, dan elemen lainnya

    + AppBar: Widget yang digunakan untuk menampilkan bagian atas aplikasi, termasuk judul dan background color
    + Icon: Widget yang digunakan untuk menampilkan icon yang sesuai dengan setiap item dalam *cards*. Icon diambil dari properti `item.icon` dan ditampilkan dengan ukuran serta warna yang sesuai

    + Text: Widget yang digunakan untuk menampilkan text yang sesuai dengan nama item. Teks diambil dari properti `item.name` dan ditampilkan dengan gaya teks yang sesuai

    + SingleChildScrollView: Widget yang memungkinkan konten halaman menjadi *scrollable* jika kontennya terlalu panjang atau banyak

    + Padding: Widget yang digunakan untuk menambahkan jarak di antara konten. Dalam kasus ini, digunakan untuk memberikan jarak dari tepi halaman

    + Column: Layout widget yang digunakan untuk menampilkan child widgets secara vertikal pada beranda aplikasi

    + GridView.count: Widget yang digunakan untuk membuat tata letak grid dengan jumlah kolom yang ditentukan

    + Material: Widget yang memberikan tampilan Material Design pada kontennya. Digunakan di dalam ShopCard untuk memberikan warna latar belakang

    + InkWell: Widget yang digunakan untuk membuat area responsif terhadap sentuhan

    + SnackBar: Widget yang digunakan untuk menampilkan pesan singkat ketika item di-klik

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    + Jalankan perintah berikut!
        ```
        flutter create val_inventory
        cd val_inventory
        flutter run
        ```

    + Lakukan `git init` pada root folder lalu `add-commit-push`!

    + Ubah kode pada `main.dart` agar me-*return* widget pada `menu.dart`!

        ```
        import 'package:flutter/material.dart';
        import 'package:val_inventory/menu.dart';

        void main() {
        runApp(const MyApp());
        }

        class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Menu',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: MyHomePage(),
            );
        }
        }
        ```
    
    + Ubah kode pada `menu.dart`!

    + Implementasikan `AppBar`, `Scaffold`, dan `body` dengan `SingleChildScrollView`!

    + Implementasikan `ShopCard` dan `Snackbar`!
        ```
        class ShopCard extends StatelessWidget {
         final Item item;
         const ShopCard(this.item, {super.key}); 

         @override
         Widget build(BuildContext context) {
            return Material(
            color: item.color,

            child: InkWell(
            onTap: () {
                ScaffoldMessenger.of(context) //SnackBar 
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },

                child: Container(
                 padding: const EdgeInsets.all(8),

                child: Center(
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                        Icon(
                         item.icon,
                         color: Colors.white,
                         size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                         item.name,
                         textAlign: TextAlign.center,
                         style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
        }
        ```

    + Bonus: Tambahkan implementasi warna-warna berbeda untuk setiap tombol!
        ```
        final List<Item> items = [
            Item("Lihat Item", Icons.checklist, Colors.indigo.shade200), 
            Item("Tambah Item", Icons.add_shopping_cart, Colors.indigo),
            Item("Logout", Icons.logout, Colors.indigo.shade900),
        ];
        ```
</details>

<details>
<summary>Tugas 8</summary>

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
    + `Navigator.push()` digunakan untuk menambahkan tampilan baru ke dalam tumpukan navigasi (navigator stack). Ini berarti bahwa tampilan baru akan ditumpuk di atas tampilan saat ini, dan pengguna dapat kembali ke tampilan sebelumnya dengan menekan tombol "Back" di perangkat mereka. 

        Contoh penggunaan `Navigator.push()`:
        ```
        // Navigator
        if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
            ));
        }
        ```
    + `Navigator.pushReplacement()` digunakan untuk menggantikan tampilan saat ini di tumpukan navigasi dengan tampilan baru. Ini berguna ketika Anda ingin menggantikan halaman saat ini dengan halaman yang berbeda, seperti saat pengguna menyelesaikan suatu aksi tertentu. Ini membuat tampilan sebelumnya dihapus dari tumpukan dan digantikan oleh tampilan baru.

        Contoh penggunaan `Navigator.pushReplacement()`:
        ```
        onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(),
            ));
        },
        ```

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
    + Single-child Layout <br>
    Widget yang hanya memiliki satu child. Penggunaannya saat hanya memerlukan satu widget dalam satu area. Salah satu widget yang umum digunakan dari kategori ini adalah Container, yang berfungsi sebagai wadah untuk widget lain.

    + Multi-child Layout <br>
    Widget yang memungkinkan memiliki lebih dari satu anak (children). Penggunaannya ketika perlu menempatkan sejumlah widget dalam satu area. Widget yang sering digunakan dari kelompok ini adalah `Row` untuk penempatan horizontal dan `Column` untuk penempatan vertikal.

    + Silver Widgets <br>
    Widget khusus untuk area scrollable, digunakan untuk menciptakan fitur dinamis saat melakukan scroll. <br>
    Contoh: `CupertinoSliverNavigationBar, CustomScrollView, SliverAppBar`, etc.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
    + `TextFormField` karena memudahkan pengguna dalam memasukkan data. Sedangkan fitur validasi dan hint-nya sangat mempercepat pekerjaan pengembang.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
    + Pada pengembangan aplikasi Flutter, prinsip *clean architecture*  diterapkan untuk mengorganisir file sesuai dengan fungsionalitasnya. <br>
    Contoh: Folder `screens` berisi files untuk tampilan layar. Sedangkan implementasi dan fungsionalitas aplikasi berada pada folder `widgets`.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
    + Buat satu halaman form baru pada aplikasi! 
    + Tambahkan 4 elemen input yaitu `name, price, amount, dan description`.
    + Implement tombol `save` serta lakukan validasi input. Cek `screens/shoplist_form.dart`!
    + Arahkan pengguna ke halaman form ketika menekan tombol `Tambah Item` pada halaman utama. Cek `widgets/shop_card.dart`!
    + Buat drawer untuk navigasi ke `Halaman Utama` dan `Tambah Item`. Cek `widgets/left_drawer.dart`!
    + Bonus: Cek `screens/shoplist_form.dart`!
</details>

<details>
<summary>Tugas 9</summary>

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
    + Ya, dengan metode sebuah variabel yang menyimpan sebuah dictionary berisi data. 
    + Mempermudah, jika data kompleks atau memerlukan manipulasi lebih lanjut, membuat model dapat membantu dalam pengelolaan data.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    + Inisialisasi session, login, dan logout
    + Informasi session cookies yang disimpan secara local
    + Permintaan HTTP dengan GET dan POST
    + `CookieRequest` dibagikan ke semua komponen di aplikasi Flutter agar status login atau sesi cookies konsisten.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
    + Dengan website *Quicktype* untuk membuat model custom dari data Json pada tugas Django.
    + Tambahkan dependensi HTTP pada `android/app/src/main/AndroidManifest.xml`
    ```
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
    ```
    + Melakukan *Fetch Data* pada `lib/screens` secara async dengan mengirim permintaan HTTP.
    + Dengan `FutureBuilder` dan `ListView.builder` data diolah dan ditampilkan pada Flutter.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    + Input `username` dan `password` pada loginPage
    + Melakukan autentikasi pada `authentication/views.py` milik Django 
    + Jika benar, diarahkan ke `HomePage` dan pesan selamat datang dengan `SnackBar`
 
5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
    + TextField: Menerima input dari user
    + FutureBuilder: Membangun widget secara asinkron
    + ListView.builder: Membuat daftar yang dapat discroll
    + Column: Menyusun komponen secara vertikal
    + Row: Menyusun komponen secara horizontal

8. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    + Pada Django, Lakukan integrasi dan autentikasi dengan Flutter
        + Buat app `authentication`!
        + Install library `corsheaders`!
    + Buat fungsi `login` pada `views.py`!
    + Install dan import package `pbp_django_auth`!
    + Pada Flutter, Import `pbp_django_auth`!
    + Modifikasi root widget sehingga menyediakan `CookieRequest`!
    + Membuat `lib/screens/login.dart`