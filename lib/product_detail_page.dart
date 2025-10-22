import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  // Warna yang mendekati maroon/burgundy
  final Color maroonColor = const Color(0xFF800000);

  @override
  Widget build(BuildContext context) {
    // Gunakan MediaDQuery untuk mendapatkan lebar layar saat ini
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Tentukan apakah layout harus menggunakan 2 kolom (layar lebar) atau 1 kolom (layar kecil)
    // Layout 2 kolom (Row) akan digunakan jika lebar layar > 650
    final bool isWideScreen = screenWidth > 650;

    // Konten utama halaman detail
    Widget detailContent = Flex(
      direction: isWideScreen ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ==== BAGIAN KIRI: Teks Detail ====
        Expanded(
          flex: isWideScreen ? 1 : 0, // Flex hanya berlaku di layar lebar
          child: Padding(
            padding: EdgeInsets.all(isWideScreen ? 40.0 : 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Owner's Club
                const Text(
                  "R",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Colors.black,
                  ),
                ),
                Text(
                  "OWNERS' CLUB",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),

                // Judul Utama (Nama Produk)
                Text(
                  product.name.toUpperCase(), // MAROON EDITION
                  style: TextStyle(
                    fontSize: 48,
                    height: 1.1,
                    fontWeight: FontWeight.w900,
                    color: maroonColor,
                  ),
                ),
                const SizedBox(height: 30),

                // Deskripsi Produk
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 40),

                // POWERED BY ENTHUSIASTS
                Text(
                  "POWERED BY ENTHUSIASTS",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                  ),
                ),
                const Text(
                  "for enthusiasts",
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'serif', // Meniru font bergaya tulisan tangan
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Harga Produk (Tambahan)
                Text(
                  "Price: ${product.price}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol "Buy Now" (Tambahan)
                 ElevatedButton(
                  onPressed: () {
                    // Logika pembelian
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Membeli ${product.name}!')
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maroonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text("BUY NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),

        // ==== BAGIAN KANAN: Gambar Model ====
        Expanded(
          flex: isWideScreen ? 1 : 0,
          child: Container(
            color: Colors.grey[100], // Background terang di belakang model
            height: isWideScreen ? MediaQuery.of(context).size.height : 500, // Tinggi penuh di layar lebar
            child: Center(
              child: AspectRatio(
                aspectRatio: 0.8, // Rasio gambar vertikal
                child: Image.asset(
                  product.imageUrl, // Placeholder
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        "Model Image Placeholder",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: detailContent,
      ),
    );
  }
}