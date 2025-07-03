import 'package:flutter/material.dart';

class KetentuanPengguna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://archify-images-prod.s3.ap-southeast-1.amazonaws.com/blog/xl/wt5u4gqg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'DIERRA\nRESTO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 60,
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ketentuan Pengguna',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      '''
Selamat datang di Dierra Resto! Demi kenyamanan bersama, kami menetapkan beberapa ketentuan yang perlu dipatuhi oleh seluruh pengunjung:

1. Jam Operasional
Dierra Resto buka setiap hari pukul 10.00 – 22.00 WIB.
Pemesanan terakhir (last order) dilakukan maksimal pukul 21.30 WIB.

2. Reservasi dan Antrian
Reservasi dapat dilakukan melalui telepon, WhatsApp, atau langsung datang ke tempat.
Bagi pelanggan tanpa reservasi, kami menerapkan sistem antrian sesuai kedatangan.

3. Pembatalan & Waktu Tunggu
Reservasi yang tidak dikonfirmasi ulang 15 menit sebelum waktu kedatangan akan dianggap batal.
Kami memberikan toleransi waktu tunggu selama 15 menit dari jadwal reservasi.

4. Pemesanan Menu
Menu yang telah dipesan tidak dapat dibatalkan kecuali ada kesalahan dari pihak kami.
Mohon informasikan kepada staf jika Anda memiliki alergi makanan tertentu.

5. Pembayaran
Kami menerima pembayaran tunai, kartu debit/kredit, dan pembayaran digital (QRIS, e-wallet).
Semua harga yang tercantum belum termasuk pajak dan layanan (jika berlaku).

6. Aturan Umum
Dilarang membawa makanan dan minuman dari luar.
Mohon menjaga kebersihan dan ketertiban selama berada di area resto.
Anak-anak berada di bawah pengawasan orang tua masing-masing.
Binatang peliharaan tidak diperkenankan, kecuali hewan pemandu (guide animals).

7. Keamanan
Dierra Resto tidak bertanggung jawab atas kehilangan barang pribadi pengunjung.
CCTV aktif selama 24 jam demi kenyamanan dan keamanan bersama.

8. Privasi
Kami menjaga privasi data pelanggan yang diberikan saat reservasi atau transaksi.
Informasi Anda tidak akan disebarluaskan tanpa persetujuan.

Dengan berkunjung ke Dierra Resto, Anda dianggap telah membaca dan menyetujui ketentuan ini. Terima kasih atas kunjungan dan kepercayaan Anda.

Salam hangat,
Tim Dierra Resto
                      ''',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
