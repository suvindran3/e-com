import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffFA5365),
            Color(0xffF74462),
            Color(0xffF7366B),
          ],
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: controller, curve: Curves.easeInOutBack),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding:
                EdgeInsets.only(top: 15.0, bottom: 20, left: 15),
                child: Text(
                  'Suvindran S',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0, left: 15),
                child: SizedBox(
                  width: 220,
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'My Cart',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'Upcoming Orders',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'Offer Zone',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.local_offer_outlined,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'My Account',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'My Chats',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.chat_outlined,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.contact_support_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
