// Detay Sayfası, seçilen ürünün detaylarını göstermek için kullanılır.

import 'package:flutter/material.dart';
import 'package:products_app/data/entity/product.dart';

class DetailPage extends StatefulWidget {
  // Seçilen ürün bilgisini içeren Product nesnesini alan bir constructor
  Products product;
  DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfa üzerinde bir App Bar oluşturuyoruz ve başlık olarak ürün adını kullanıyoruz
      appBar: AppBar(
        title: Text(widget.product.name),
      ),

      // Sayfa içeriğini oluşturuyoruz
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Ürünün görselini gösteren bir Image Widget'ı oluşturuyoruz
            Image.asset("images/${widget.product.image}"),

            // Ürün fiyatını gösteren bir Text Widget'ı oluşturuyoruz
            Text(
              "${widget.product.price}",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
