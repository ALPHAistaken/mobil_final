import 'package:flutter/material.dart';

class Cart {
  static List<Product> items = [];

  static double getTotalPrice() {
    return items.fold(0, (sum, product) => sum + product.price);
  }

  static void clearCart() {
    items.clear();
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Ürün 1",
      description: "Maske Bandana Boyunluk: Head Extreme 12 Fonksiyon!",
      price: 98.99,
      image: "assets/images/ürün1.jpg",
    ),
    Product(
      name: "Ürün 2",
      description: "Cüzdanınızdaki Alet Sandığı: MultiTool",
      price: 41.99,
      image: "assets/images/ürün2.jpg",
    ),
    Product(
      name: "Ürün 3",
      description: "Hava Yastıklı Boy Uzatıcı Tabanlık Tam Boy ",
      price: 147.99,
      image: "assets/images/ürün3.jpg",
    ),
    Product(
      name: "Ürün 4",
      description: "Yüzük Tasarım Telefon Tablet Tutucu",
      price: 150.0,
      image: "assets/images/ürün4.jpg",
    ),
    Product(
      name: "Ürün 5",
      description: "Limon Sıkacağı",
      price: 56.99,
      image: "assets/images/ürün5.jpg",
    ),
    Product(
      name: "Ürün 6",
      description: "Pati Tasarımlı Yıkanabilir Çok Amaçlı Tüy Toz Toplayıcı",
      price: 21.00,
      image: "assets/images/ürün6.jpg",
    ),
    Product(
      name: "Ürün 7",
      description: "Siyah Geyik Tasarımlı Takı, Mücevher Standı",
      price: 50.99,
      image: "assets/images/ürün7.jpeg",
    ),
    Product(
      name: "Ürün 8",
      description: "Çok Fonksiyonlu Katlanır Kamp Küreği: Katlanabilen Kürek",
      price: 150.0,
      image: "assets/images/ürün8.jpg",
    ),
    Product(
      name: "Ürün 9",
      description: "Çok Amaçlı Güçlü Neodyum Mıknatıs Manyetik Kanca Askı",
      price: 82.99,
      image: "assets/images/ürün9.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürünler"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10),
              ProductItem(product: products[index]),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Sepete gidildiğinde eklenen ürünleri ve toplam tutarı göster
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoppingCartScreen(),
            ),
          );
        },
        label: Text("Sepet"),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.asset(
          product.image,
          width: 100,
          height: 100,
        ),
        title: Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(product.description),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${product.price.toStringAsFixed(2)} TL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                // Sepete ekleme işlemi
                Cart.items.add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.name} sepete eklendi."),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              child: Text("Sepete Ekle", style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Cart.items[index].description),
                  trailing: Text(
                    "${Cart.items[index].price.toStringAsFixed(2)} TL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Image.asset(
                    Cart.items[index].image,
                    width: 50,
                    height: 50,
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Toplam Tutar"),
            trailing: Text(
              "${Cart.getTotalPrice().toStringAsFixed(2)} TL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _confirmOrder(context);
            },
            child: Text("Sepeti Onayla"),
          ),
        ],
      ),
    );
  }

  void _confirmOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Siparişi Onayla'),
        content: Text('Siparişiniz başarıyla onaylandı.'),
        actions: [
          TextButton(
            onPressed: () {
              Cart.clearCart();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Sepet sıfırlandı.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ProductsScreen(),
    ),
  );
}
