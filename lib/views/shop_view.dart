// lib/views/shop_view.dart
import 'package:flutter/material.dart';
import '../models/shop_item.dart';
import '../widgets/shop_item_tile.dart';

class ShopView extends StatelessWidget {
  ShopView({Key? key}) : super(key: key);

  // Exemple de données du shop
  final List<ShopItem> shopItems = [
    ShopItem(
      id: 'shop1',
      name: 'Badge Premium',
      description: 'Obtenez un badge exclusif.',
      price: 1.99,
      imageUrl: 'assets/images/badges/badge1.png',
    ),
    ShopItem(
      id: 'shop2',
      name: 'Leçon Premium',
      description: 'Accès à une leçon avancée.',
      price: 4.99,
      imageUrl: 'assets/images/badges/badge2.png',
    ),
    // Ajoute d'autres éléments ici
  ];

  void buyItem(BuildContext context, ShopItem item) {
    // Logique d'achat à implémenter avec Firebase ou un autre service
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Vous avez acheté ${item.name}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique'),
      ),
      body: ListView.builder(
        itemCount: shopItems.length,
        itemBuilder: (context, index) {
          return ShopItemTile(
            item: shopItems[index],
            onBuy: () => buyItem(context, shopItems[index]),
          );
        },
      ),
    );
  }
}
