# Flutter-State-Management

# Praktikum 1 
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




