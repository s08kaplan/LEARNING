import 'package:flutter/material.dart';
import 'package:project_1/model/cart_model.dart';

class CartDetail extends StatefulWidget {
  final Products product;
  const CartDetail({super.key, required this.product});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
int _counter = 0;
void _increaseQuantity(){
setState(() {
  _counter++;
});
}

void _decreaseQuantity(){
setState(() {
if(_counter > 0)  _counter--;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.product.title ?? "Product Details"),
        backgroundColor: Theme.of(context).primaryColor ,
      ),
      backgroundColor: Theme.of(context).primaryColor,
       body:Center(
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.product.thumbnail != null)
              Image.network(widget.product.thumbnail!, height:200, fit: BoxFit.cover),
               const SizedBox(height: 16),
              Text("Title: ${widget.product.title}", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 8),
              Text("Price: \$${widget.product.price}", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("Quantity: ${widget.product.quantity}", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("Total: \$${widget.product.total}", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("Discount: ${widget.product.discountPercentage}%"),
            ],
          ),
       )
    );
  }
}