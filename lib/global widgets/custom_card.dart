import 'package:flutter/material.dart';
import '../cartItem.dart'; // Ensure this path is correct for your Cartitem model

class CustomCard extends StatefulWidget {
  final List<Cartitem> cartItems;
  final VoidCallback onQuantityChanged;// Taking cart items from HomeScreen

  CustomCard({Key? key, required this.cartItems, required this.onQuantityChanged}) : super(key: key); // Fixed constructor

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  // Method to update quantity
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _updateQuantity(int index, int delta) {
    setState(() {
      widget.cartItems[index].quantity += delta;
      if (widget.cartItems[index].quantity < 1) {
        widget.cartItems[index].quantity = 1;
      }
      _calculateTotalPrice(); // Update total price when quantity changes
    });
    widget.onQuantityChanged();
  }

  void increaseQuantity(int index) {
    _updateQuantity(index, 1);
  }

  void decreaseQuantity(int index) {
    _updateQuantity(index, -1);
  }

  void _calculateTotalPrice() {
    setState(() {
      totalPrice = 0.0; // Reset total price before recalculation
      for (var item in widget.cartItems) {
        totalPrice += item.price * item.quantity;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:widget.cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    widget.cartItems[index].image,
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.cartItems[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Color: ${widget.cartItems[index].color}  Size: ${widget.cartItems[index].size}'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(index),
                      ),
                      Text('${widget.cartItems[index].quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => increaseQuantity(index),
                      ),
                    ],
                  ),
                  Text('\$${widget.cartItems[index].price * widget.cartItems[index].quantity}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
