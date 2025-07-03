import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pembayaran Selesai',
      debugShowCheckedModeBanner: false,
      home: const selesai(totalBayar: 85000), // Contoh pemanggilan
    );
  }
}

class selesai extends StatelessWidget {
  final int totalBayar;
  final int uangDiterima;

  const selesai({
    super.key,
    required this.totalBayar,
    this.uangDiterima = 150000,
  });

  @override
  Widget build(BuildContext context) {
    int kembalian = uangDiterima - totalBayar;

    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xFF269A92),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              "Pembayaran Selesai",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            width: double.infinity,
            color: const Color(0xFF269A92),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  radius: 30,
                  child: const Icon(Icons.check, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Pembayaran Berhasil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Detail Pembayaran",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  _buildRow(
                    "Tanggal Transaksi",
                    DateFormat("d MMM yyyy, HH:mm").format(DateTime.now()),
                  ),
                  _buildRow(
                    "ID Transaksi",
                    "TXN-${DateTime.now().millisecondsSinceEpoch}",
                  ),
                  _buildRow("Metode Pembayaran", "💵 Tunai"),
                  _buildRow("Total Bayar", formatCurrency.format(totalBayar)),
                  _buildRow(
                    "Uang Diterima",
                    formatCurrency.format(uangDiterima),
                  ),
                  _buildRow("Kembalian", formatCurrency.format(kembalian)),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF5A46F0)),
                foregroundColor: Color(0xFF5A46F0),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Kembali ke Beranda"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
