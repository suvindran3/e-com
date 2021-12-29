import 'package:ecom/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductScreen(),
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 200,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.chair,
                  size: 90,
                  color: Colors.grey,
                ),
                const Text(
                  'Panka Chair',
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('\$ 1000'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: const Color(0xffEFF0F0),
                          child: IconButton(
                            iconSize: 18,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Color(0xffF7366B),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
