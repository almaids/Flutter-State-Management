# Flutter-State-Management

# Praktikum 1 - Dasar State dengan Model-View
# Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
Langkah 4 adalah membuat file data_layer.dart yang berfungsi sebagai mengekspor untuk file model data seperti plan.dart dan task.dart. Dengan pendekatan ini, ketika file lain dalam aplikasi memerlukan akses ke model-model tersebut, cukup mengimpor satu file data_layer.dart saja, tanpa perlu mengimpor setiap file model secara individual. Metode dilakukan untuk meningkatkan efisiensi dalam pengembangan proyek.

# Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
Variabel plan pada langkah 6 diperlukan sebagai objek utama yang menyimpan daftar tugas dalam aplikasi. Variabel ini dibuat sebagai konstanta (const Plan()) agar memiliki nilai awal yang tetap, sehingga lebih aman dan stabil. Dengan pendekatan ini, perubahan data tetap terkontrol melalui metode setState(), tanpa langsung memodifikasi objek yang sudah ada.

# Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Pada praktikum ini, telah dikembangkan sebuah aplikasi berbasis Flutter yang berfungsi sebagai aplikasi perencanaan tugas atau task planner. Aplikasi ini memungkinkan pengguna untuk menambahkan daftar tugas atau rencana kerja.
![Praktikum 1](https://github.com/user-attachments/assets/6afb9643-de0b-4234-8eb5-5ebe4457b340)

# Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
- Langkah 11 (initState()):
Metode ini dipanggil saat widget pertama kali dibuat. Pada langkah ini, scrollController diinisialisasi dan diberikan listener untuk mendeteksi pergerakan gulir. Ketika pengguna menggulir layar, fokus pada TextField akan dihapus guna menghindari kendala saat mengetik di bagian bawah layar.
- Langkah 13 (dispose()):
Metode ini dijalankan ketika widget tidak lagi digunakan. Pada langkah ini, scrollController dibersihkan dengan memanggil dispose(), sehingga mencegah terjadinya memory leak akibat objek yang tidak lagi diperlukan.


# Praktikum 2 - InheritedWidget
# Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
Pada langkah 1, InheritedWidget yang dimaksud adalah kelas PlanProvider, yang diturunkan dari InheritedNotifier. InheritedNotifier digunakan untuk memisahkan state dan UI secara efisien. Dengan ValueNotifier, perubahan data dipantau otomatis, sehingga hanya widget yang perlu diperbarui yang dirender ulang, tanpa memengaruhi seluruh pohon widget. Pendekatan ini membuat aplikasi lebih optimal, terutama untuk to-do list, di mana data sering berubah.

# Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
Langkah 3 menambahkan dua metode dalam model Plan untuk menghitung jumlah tugas yang telah selesai dan menampilkan pesan kemajuan dalam format yang mudah dibaca, seperti "1/2 Tasks"
Pendekatan ini menghindari perhitungan ulang jumlah tugas yang selesai langsung di UI, sehingga kode menjadi lebih rapi dan terorganisir. Dengan menempatkan logika ini di dalam model, UI hanya perlu memanggil metode yang tersedia untuk menampilkan progres tanpa harus melakukan perhitungan secara manual.

# Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Pada praktikum ini, telah dikembangkan aplikasi task planner berbasis Flutter yang memungkinkan pengguna menambahkan, mengelola, dan memantau daftar tugas, dengan sistem perhitungan progres otomatis untuk menampilkan jumlah tugas yang telah diselesaikan dalam format yang lebih rapi dan terorganisir.
![Praktikum 2](https://github.com/user-attachments/assets/81982ac5-c25b-45b8-b324-40613c0048c8)

# Praktikum 3 - State di Multiple Screens
# Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
Diagram ini menggambarkan proses navigasi antar halaman dalam aplikasi Flutter yang menggunakan Navigator.push dan manajemen state dengan PlanProvider.
- Sebelum Navigasi (PlanCreatorScreen)
MaterialApp berperan sebagai pembungkus utama yang mencakup PlanProvider.
PlanCreatorScreen digunakan untuk membuat serta menampilkan daftar rencana.
Struktur di dalamnya mencakup:
TextField untuk menambahkan rencana baru.
ListView dalam Expanded untuk menampilkan daftar rencana yang sudah dibuat.

- Proses Navigasi
Saat pengguna memilih sebuah rencana, aplikasi berpindah ke halaman detail rencana, yaitu PlanScreen, menggunakan Navigator.push.

- Setelah Navigasi (PlanScreen)
PlanScreen menampilkan detail rencana yang dipilih.
Struktur UI terdiri dari:
Expanded dengan ListView untuk menampilkan daftar tugas dalam rencana.
SafeArea yang berisi Text, memastikan informasi tetap terlihat dengan baik tanpa tertutup notifikasi atau tombol navigasi.

# Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Pada praktikum ini, telah dikembangkan sebuah aplikasi task planner berbasis Flutter yang memungkinkan pengguna untuk membuat, mengelola, dan melihat daftar rencana mereka. Aplikasi ini menggunakan state management untuk menyimpan dan menampilkan data rencana, serta memanfaatkan Navigator.push untuk berpindah antar halaman. Selain itu, sistem menampilkan pesan informasi jika belum ada rencana yang dibuat, sehingga meningkatkan pengalaman pengguna dalam mengelola tugas mereka.
![praktikum 3](https://github.com/user-attachments/assets/f2dfc056-80d5-4ac1-8115-13f72dc3ae47)






