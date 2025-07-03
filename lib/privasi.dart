import 'package:flutter/material.dart';

class KebijakanPrivasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
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
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Kebijakan Privasi',
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
Dierra Resto berkomitmen untuk melindungi dan menghormati privasi Anda. Kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, menyimpan, dan melindungi data pribadi Anda.

1. Informasi yang Kami Kumpulkan
Kami dapat mengumpulkan informasi berikut:
- Nama lengkap
- Nomor telepon
- Alamat email
- Informasi pemesanan (tanggal, jumlah orang, preferensi tempat duduk)
- Data pembayaran (hanya melalui sistem yang aman)
- Informasi yang Anda berikan melalui formulir kontak, survei, atau program loyalti.

2. Tujuan Penggunaan Informasi
Informasi yang kami kumpulkan digunakan untuk:
- Memproses reservasi dan pesanan
- Menghubungi Anda terkait reservasi, promosi, atau informasi penting lainnya
- Meningkatkan layanan dan pengalaman pelanggan
- Kepentingan administratif dan keamanan
- Pengiriman newsletter (jika Anda telah setuju untuk menerimanya).

3. Perlindungan Data
Kami mengambil langkah-langkah keamanan teknis dan organisasi yang wajar untuk melindungi data pribadi Anda dari akses yang tidak sah, kehilangan, atau penyalahgunaan.

4. Berbagi Informasi
Kami tidak akan pernah menjual atau membagikan data pribadi Anda kepada pihak ketiga, kecuali:
- Diperlukan oleh hukum atau perintah pengadilan
- Dibutuhkan untuk penyedia layanan pihak ketiga yang bekerja atas nama kami (misalnya, sistem pembayaran online), dengan perjanjian kerahasiaan yang berlaku.

5. Cookies & Teknologi Pelacak
Jika Anda mengunjungi situs kami, kami mungkin menggunakan cookies untuk meningkatkan pengalaman pengguna. Anda dapat mengatur browser Anda untuk menolak cookies, namun beberapa fitur situs mungkin tidak bekerja dengan baik.

6. Hak Anda
Anda memiliki hak untuk:
- Mengakses data pribadi Anda yang kami simpan
- Memperbaiki atau memperbarui informasi Anda
- Meminta penghapusan data, sesuai hukum yang berlaku
- Menarik persetujuan penggunaan data (seperti berhenti berlangganan dari promosi).

7. Perubahan Kebijakan
Kebijakan ini dapat diperbarui dari waktu ke waktu. Perubahan akan diumumkan di situs atau media resmi kami. Tanggal revisi terbaru akan selalu tercantum di bagian bawah.
                      ''',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
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
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
