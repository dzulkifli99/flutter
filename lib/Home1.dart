import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Keranjang.dart';

void main() {
  runApp(Home1());
}

class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan & Minuman',
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> cart = [];
  String selectedCategory = 'Makanan';

  final List<Map<String, dynamic>> foods = [
    {
      "name": "Nasi Goreng",
      "desc": "Nasi goreng spesial dengan telur",
      "price": "Rp 20.000",
      "image":
          "https://christieathome.com/wp-content/uploads/2021/01/Nasi-Goreng-4-b-scaled.jpg",
    },
    {
      "name": "Mie Goreng",
      "desc": "Mie goreng pedas dengan sayur",
      "price": "Rp 18.000",
      "image": "https://images.unsplash.com/photo-1589302168068-964664d93dc0",
    },
    {
      "name": "Sate Ayam",
      "desc": "Sate ayam bumbu kacang",
      "price": "Rp 25.000",
      "image": "https://images.unsplash.com/photo-1617196030234-5f0eb4f6a6cc",
    },
    {
      "name": "Bakso",
      "desc": "Semangkuk bakso sapi hangat",
      "price": "Rp 22.000",
      "image": "https://images.unsplash.com/photo-1604467791891-a2d69b4cdbb5",
    },
    {
      "name": "Rendang",
      "desc": "Rendang khas Padang",
      "price": "Rp 30.000",
      "image": "https://images.unsplash.com/photo-1640506051224-43c2b83b8048",
    },
    {
      "name": "Ayam Geprek",
      "desc": "Ayam geprek super pedas",
      "price": "Rp 19.000",
      "image": "https://images.unsplash.com/photo-1576402187874-4a54a187f53b",
    },
    {
      "name": "Gado-Gado",
      "desc": "Sayur dengan bumbu kacang",
      "price": "Rp 17.000",
      "image": "https://images.unsplash.com/photo-1621989583139-57a2b2c96c40",
    },
    {
      "name": "Soto Ayam",
      "desc": "Soto ayam dengan nasi",
      "price": "Rp 21.000",
      "image": "https://images.unsplash.com/photo-1603117981024-e06c5f9b8107",
    },
    {
      "name": "Nasi Uduk",
      "desc": "Nasi uduk dan lauk lengkap",
      "price": "Rp 18.000",
      "image": "https://images.unsplash.com/photo-1606280800251-3295d01f73b5",
    },
    {
      "name": "Pempek",
      "desc": "Pempek Palembang asli",
      "price": "Rp 16.000",
      "image": "https://images.unsplash.com/photo-1630571852740-b22d6e6e0654",
    },
  ];

  final List<Map<String, dynamic>> drinks = [
    {
      "name": "Es Teh Manis",
      "desc": "Teh manis segar dengan es",
      "price": "Rp 8.000",
      "image": "https://images.unsplash.com/photo-1621929514423-b7c2ec233b52",
    },
    {
      "name": "Jus Jeruk",
      "desc": "Jus jeruk segar alami",
      "price": "Rp 10.000",
      "image": "https://images.unsplash.com/photo-1600431521340-491eca880813",
    },
    {
      "name": "Kopi Hitam",
      "desc": "Kopi hitam tanpa gula",
      "price": "Rp 12.000",
      "image": "https://images.unsplash.com/photo-1551024601-bec78aea704b",
    },
    {
      "name": "Susu Coklat",
      "desc": "Susu coklat dingin",
      "price": "Rp 11.000",
      "image": "https://images.unsplash.com/photo-1599023615151-2a5b32a1d72c",
    },
    {
      "name": "Es Campur",
      "desc": "Campuran buah dan sirup",
      "price": "Rp 15.000",
      "image": "https://images.unsplash.com/photo-1626115582719-67a9286f00f0",
    },
    {
      "name": "Teh Hijau",
      "desc": "Teh hijau sehat",
      "price": "Rp 9.000",
      "image": "https://images.unsplash.com/photo-1600084534944-d4746c9d2f07",
    },
    {
      "name": "Soda Gembira",
      "desc": "Minuman bersoda dan susu",
      "price": "Rp 13.000",
      "image": "https://images.unsplash.com/photo-1626115054224-7c57f6cc733f",
    },
    {
      "name": "Jus Alpukat",
      "desc": "Alpukat segar dan coklat",
      "price": "Rp 14.000",
      "image": "https://images.unsplash.com/photo-1605018363283-e3d6a218f7d8",
    },
    {
      "name": "Air Mineral",
      "desc": "Air mineral dingin",
      "price": "Rp 5.000",
      "image": "https://images.unsplash.com/photo-1606761568799-bc7472d8c1be",
    },
    {
      "name": "Milkshake Stroberi",
      "desc": "Susu stroberi dingin",
      "price": "Rp 15.000",
      "image": "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445",
    },
  ];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item["name"]} ditambahkan ke keranjang')),
    );
  }

  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
    );
  }

  void openProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedItems =
        selectedCategory == 'Makanan' ? foods : drinks;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Text(
                    "MENU\nDIERRA RESTO",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(icon: Icon(Icons.person), onPressed: openProfile),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari makanan favorit...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            // Tab Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildTabButton("Makanan"),
                  SizedBox(width: 10),
                  buildTabButton("Minuman"),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Item Grid
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children:
                      displayedItems.map((item) {
                        return ItemCard(
                          item: item,
                          onAdd: () => addToCart(item),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating cart with badge
      floatingActionButton: Stack(
        alignment: Alignment.topRight,
        children: [
          FloatingActionButton(
            onPressed: openCart,
            child: Icon(Icons.shopping_cart),
          ),
          if (cart.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '${cart.length}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTabButton(String label) {
    final bool isSelected = selectedCategory == label;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          setState(() {
            selectedCategory = label;
          });
        },
        child: Text(label),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAdd;

  const ItemCard({required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              item["image"],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item["name"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item["desc"],
              maxLines: 2,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(item["price"], style: TextStyle(color: Colors.blue)),
                Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Icon(Icons.add_circle, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  const CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Keranjang")),
      body:
          cart.isEmpty
              ? Center(child: Text("Keranjang masih kosong"))
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    leading: Image.network(
                      item["image"],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item["name"]),
                    subtitle: Text(item["price"]),
                  );
                },
              ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  void editProfile(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit profil ditekan')));
  }

  void viewOrders(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Lihat pesanan ditekan')));
  }

  void signOut(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logout ditekan')));
    Navigator.of(context).popUntil((route) => route.isFirst); // kembali ke awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101840),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text("Profil"),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF1A2A6C).withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.green, size: 40),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasbyallah",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "hasby9874@gmail.com",
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        Text(
                          "083233875755",
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => editProfile(context),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.receipt_long, color: Colors.white),
                title: Text("Pesanan", style: TextStyle(color: Colors.white)),
                onTap: () => viewOrders(context),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Sign Out", style: TextStyle(color: Colors.white)),
                onTap: () => signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
