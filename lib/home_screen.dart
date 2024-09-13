import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cartItem.dart';
import 'global widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<HomeScreen> {
  List<Cartitem> cartitem = [
    Cartitem(
      name: "Pullover Shirt",
      color: "Black",
      size: "M",
      image: "assets/image/t shirt.png", // Make sure the path is correct
      price: 20,
    ),
    Cartitem(
      name: "T-Shirt",
      color: "Gray",
      size: "L",
      image: "assets/image/t shirt.png", // Make sure the path is correct
      price: 25,
    ),
    Cartitem(
      name: "Sport Dress",
      color: "Black",
      size: "M",
      image: "assets/image/t shirt.png", // Make sure the path is correct
      price: 43,
    ),
  ];

  // Calculate total amount based on quantity
  double getTotalAmount() {
    double total = 0;
    for (var item in cartitem) {
      total += item.price * item.quantity;
    }
    return total;
  }
  void _onQuantityChanged() {
    setState(() {}); // totall price update korbe
  }

  //snakbar messeage
  Mysnakbar(messeage,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(messeage),
        duration: Duration.zero,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My cart", style: TextStyle(fontSize: 30)),
      ),
      body: Column(
        children: [
          CustomCard(cartItems: cartitem, onQuantityChanged: _onQuantityChanged,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total amount:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${getTotalAmount()}\$',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Mysnakbar("Thank you", context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'CHECK OUT',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
