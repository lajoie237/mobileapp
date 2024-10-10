// lib/widgets/shop_item_tile.dart
import 'package:flutter/material.dart';
import '../models/shop_item.dart';

class ShopItemTile extends StatelessWidget {
  final ShopItem item;
  final VoidCallback onBuy;

  ShopItemTile({required this.item, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 50,
          height: 50,
        ),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text('\$${item.price.toStringAsFixed(2)}'),
        onTap: onBuy,
      ),
    );
  }
}
