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
    + a 

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
    + a

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
    + a

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
    + a 
