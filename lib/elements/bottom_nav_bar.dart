import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<IconData> iconData = [
    Icons.local_shipping_outlined,
    Icons.home_filled,
    Icons.account_circle_outlined
  ];
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(bottom: 5),
        child: Material(
          type: MaterialType.transparency,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              3,
              (index) => BottomNavElement(
                iconData: iconData[index],
                selected: selected == index ? true : false,
                onTap: () => setState(() => selected = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavElement extends StatelessWidget {
  final IconData iconData;
  final bool selected;
  final VoidCallback onTap;

  const BottomNavElement({
    Key? key,
    required this.iconData,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: onTap,
          alignment: selected ? Alignment.bottomCenter : Alignment.center,
          padding:
              selected ? const EdgeInsets.all(5) : const EdgeInsets.all(8.0),
          icon: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        if (selected)
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: CircleAvatar(
              radius: 2,
              backgroundColor: Colors.white,
            ),
          ),
      ],
    );
  }
}
