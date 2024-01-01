// Gerekli paket ve dosyaları içe aktarıyoruz
import 'package:flutter/material.dart';
import 'package:products_app/data/entity/product.dart';
import 'package:products_app/ui/views/detail_page.dart';

// Ana sayfa için Stateful Widget oluşturuyoruz
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

// Homepage widget'ının durumunu yöneten State sınıfını oluşturuyoruz
class _HomepageState extends State<Homepage> {
  // Ürünleri asenkron olarak yüklemek için bir fonksiyon
  Future<List<Products>> productsLoad() async {
    // Products objelerini saklamak için boş bir liste oluşturuyoruz
    var productsList = <Products>[];

    // Products objelerini oluşturup listeye ekliyoruz
    var u1 = Products(id: 1, name: "Macbook Pro 14", image: "bilgisayar.png", price: 48000);
    var u2 = Products(id: 2, name: "Rayban Club Master", image: "gozluk.png", price: 4500);
    var u3 = Products(id: 3, name: "Sony ZX Series", image: "kulaklik.png", price: 2900);
    var u4 = Products(id: 4, name: "Gio Armani", image: "parfum.png", price: 1250);
    var u5 = Products(id: 5, name: "Casio X Series", image: "saat.png", price: 3562);
    var u6 = Products(id: 6, name: "Dyson V8", image: "supurge.png", price: 5632);
    var u7 = Products(id: 7, name: "Iphone 13", image: "telefon.png", price: 36000);

    productsList.add(u1);
    productsList.add(u2);
    productsList.add(u3);
    productsList.add(u4);
    productsList.add(u5);
    productsList.add(u6);
    productsList.add(u7);

    // Products listesini döndürüyoruz
    return productsList;
  }

  // Homepage için UI'ı oluşturuyoruz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar'ı ayarlıyoruz
      appBar: AppBar(
        title: const Text("Products"),
      ),

      // FutureBuilder kullanarak widget'ın içeriğini oluşturuyoruz
      body: FutureBuilder<List<Products>>(
        future: productsLoad(),
        builder: (context, snapshot) {
          // Verinin yüklenip yüklenmediğini kontrol ediyoruz
          if (snapshot.hasData) {
            // Snapshot'tan Products listesini çıkartıyoruz
            var productsList = snapshot.data;

            // Ürünleri göstermek için bir ListView oluşturuyoruz
            return ListView.builder(
              itemCount: productsList!.length,
              itemBuilder: (context, index) {
                var product = productsList[index];

                // Ürün üzerine tıklamak için GestureDetector oluşturuyoruz
                return GestureDetector(
                  onTap: () {
                    // Seçilen ürünle birlikte DetailPage'e geçiş yapılıyor
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                  // Her bir ürünü göstermek için bir Card oluşturuyoruz
                  child: Card(
                    child: Row(
                      children: [
                        // Ürünün görselini gösteren bir Image Widget'ı oluşturuyoruz
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 128,
                            width: 128,
                            child: Image.asset("images/${product.image}"),
                          ),
                        ),
                        
                        // Spacer widget'ı ile araya boşluk ekliyoruz
                        Spacer(),
                        
                        // Ürün bilgilerini ve sepete ekle butonunu gösteren bir Column oluşturuyoruz
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(product.name),
                            Text("${product.price} ₺"),
                            
                            // Sepete ekle butonu
                            ElevatedButton(
                              onPressed: () {
                                print("${product.name} sepete eklendi");
                              },
                              child: const Text("Sepete Ekle"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // Veri henüz yüklenmediyse, bir merkez widget'ı döndürüyoruz
            return const Center();
          }
        },
      ),
    );
  }
}
