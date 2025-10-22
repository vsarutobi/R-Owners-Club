import 'package:flutter/material.dart';
import 'user.dart';
import 'product.dart'; // IMPORT product.dart yang baru
import 'product_detail_page.dart'; // IMPORT halaman detail

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User currentUser;

  // Data produk statis dengan deskripsi ditambahkan
  final List<Product> productList = [
    Product(
      "JACKETS",
      "adidas X Pop Polo shirt, navy/blue",
      "\$69.99",
      "assets/polo.jpg",
      "Polo shirt kolaborasi eksklusif dengan garis-garis navy dan biru, terbuat dari bahan katun piqué yang nyaman untuk tampilan kasual yang rapi.",
    ),
    Product(
      "JACKETS",
      "adidas X Pop TRX Vintage, navy/white",
      "\$99.99",
      "assets/sneakers.jpg",
      "Sepatu lari vintage tahun 70-an yang dihidupkan kembali dengan warna navy dan aksen putih. Sol karet yang menawarkan cengkeraman maksimal dengan sentuhan gaya retro.",
    ),
    Product(
      "JACKETS",
      "adidas X Pop Beckenbauer Track jacket",
      "\$120.00",
      "assets/track_jacket.jpg",
      "Jaket track legendaris dari Beckenbauer dalam warna biru navy klasik. Dilengkapi ritsleting penuh, kerah berdiri, dan tiga garis ikonik di lengan.",
    ),
    Product(
      "JACKETS",
      "adidas X Pop Classic T-shirt, grey/navy",
      "\$50.00",
      "assets/tshirt_grey.jpg",
      "T-shirt klasik berwarna abu-abu dengan logo Trefoil kecil yang tercetak berulang. Lengan bergaris navy untuk tampilan sporty yang santai.",
    ),
    Product(
      "JACKETS",
      "adidas X Pop SL Cap, navy/white",
      "\$55.00",
      "assets/cap.jpg",
      "Topi baseball premium dengan detail tiga garis khas di bagian depan. Warna navy dengan aksen putih, dilengkapi tali pengatur ukuran di bagian belakang.",
    ),
    Product(
      "JACKETS",
      "Butter Yard Pullover Hood, denim",
      "\$120.00",
      "assets/hoodie.jpg",
      "Hoodie pullover berbahan fleece tebal dengan finishing denim-wash. Desain grafis 'Butter Yard' di bagian dada memberikan nuansa streetwear yang unik.",
    ),
    Product(
      "JACKETS",
      "Puma Rug Pull T-shirt, white",
      "\$60.00",
      "assets/tshirt_white.jpg",
      "T-shirt putih dengan potongan reguler. Menampilkan grafis artistik berwarna-warni yang terinspirasi dari gaya *rug-pull* atau seni abstrak modern.",
    ),
    Product(
      "JACKETS",
      "Carhartt L/S Deadkebab Sweat",
      "\$130.00",
      "assets/sweater.jpg",
      "Sweater crewneck lengan panjang dari Carhartt. Berwarna abu-abu terang dengan cetakan grafis kartun 'Knock Knock' di bagian dada yang menarik perhatian.",
    ),
  ];

  // Kategori yang ada di navigation bar gambar
  final List<String> categories = [
    "WOMEN",
    "MEN",
    "SHOES",
    "BAGS",
    "ACCESSORIES",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.username.toLowerCase() == "admin") {
      currentUser = PremiumUser(widget.username);
    } else {
      currentUser = User(widget.username);
    }
  }

  // Widget untuk membuat kotak kategori (WOMEN, MEN, dll.) (Tidak Berubah)
  Widget _buildCategoryItem(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: title == "MEN" ? Colors.black : Colors.grey[600],
          fontWeight: title == "MEN" ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Widget untuk menampilkan setiap produk di GridView
  // ... kode sebelumnya ...

  // Widget untuk menampilkan setiap produk di GridView
  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        // NAVIGASI ke halaman detail saat diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Container(
              height: 230, // Disesuaikan kembali untuk tampilan lebih baik
              width: double.infinity,
              color: Colors.grey[200],
              child: ClipRRect(
                // MENGGANTI TEXT PLACEHOLDER DENGAN Image.asset
                borderRadius: BorderRadius.circular(
                  4.0,
                ), // Opsional: Tambahkan sedikit sudut membulat
                child: Image.asset(
                  product.imageUrl, // Menggunakan path gambar dari objek produk
                  fit:
                      BoxFit.cover, // Memastikan gambar menutupi area container
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback jika gambar tidak dapat dimuat
                    return Center(
                      child: Text(
                        "⚠ Gagal memuat gambar:\n${product.imageUrl}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red, fontSize: 8),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 13),

            // ... kode setelahnya ...

            // Kategori JACKETS/SHOES
            Text(
              product.category,
              style: TextStyle(fontSize: 8, color: Colors.grey[700]),
            ),

            // Nama Produk
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Harga
            Text(
              product.price,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  currentUser.welcomeMessage(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: categories
                    .map((cat) => _buildCategoryItem(cat))
                    .toList(),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 945),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.77, // Disesuaikan untuk 4 kolom
                  ),
                  itemBuilder: (context, index) {
                    return _buildProductCard(productList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
