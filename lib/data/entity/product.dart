// Products sınıfı, uygulamanızdaki ürünleri temsil etmek üzere kullanılır.

class Products {
  // Ürünün benzersiz kimliği
  int id;

  // Ürünün adı
  String name;

  // Ürünün görseli için dosya adı veya yolunu içeren bir string
  String image;

  // Ürünün fiyatı
  int price;

  // Products sınıfının constructor'ı, gerekli tüm bilgileri alır ve nesneyi oluşturur
  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}
