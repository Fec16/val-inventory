import 'package:flutter/material.dart';

class Item {
  String name;
  int price;
  int amount;
  String description;

  Item(this.name, this.price, this.amount, this.description);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      //Responsive on tap
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(item.name),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Harga: ${item.price}'),
                    Text('Jumlah: ${item.amount}'),
                    Text('Deskripsi: ${item.description}'),
                  ],
                ),
              ),

              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },

      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), 
            ),
          ],
        ),

        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade200,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Harga: ${item.price}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Jumlah: ${item.amount}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Deskripsi: ${item.description}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}