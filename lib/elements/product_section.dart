import 'package:ecom/elements/product_card.dart';
import 'package:flutter/material.dart';

class ProductSection extends StatefulWidget {
  final String sectionName;
  final bool categoryList;

  const ProductSection({
    Key? key,
    required this.sectionName,
    required this.categoryList,
  }) : super(key: key);

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  final List<String> categories = [
    'All',
    'Electronics and Appliances',
    'Mobile Phones',
    'Shirts'
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.categoryList ? 310 : 260,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.sectionName.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            trailing: const Text(
              'See All',
              style: TextStyle(
                color: Color(0xfff7366b),
              ),
            ),
          ),
          if (widget.categoryList)
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15, bottom: 18),
                itemBuilder: (context, index) => CategoryCard(
                  categoryName: categories[index],
                  selected: selected == index ? true : false,
                  onTap: () => setState(() => selected = index),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListView.builder(
                itemCount: 7,
                itemExtent: 160,
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const ProductCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final bool selected;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.categoryName,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: !selected
              ? const Color(0xffF0F0F2)
              : Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          categoryName,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
