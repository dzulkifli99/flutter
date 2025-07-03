import 'package:flutter/material.dart';

void main() {
  runApp(coba());
}

class coba extends StatelessWidget {
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
    // Tambah item lainnya...
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
    // Tambah item lainnya...
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
                    "Menu Makanan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

      // Floating Cart Button
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
    Navigator.of(context).popUntil((route) => route.isFirst);
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
