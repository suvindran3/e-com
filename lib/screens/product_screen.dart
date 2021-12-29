import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  final String dummyData =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent '
      'et massa porta, blandit tortor luctus, suscipit nibh. Proin at '
      'ligula ac urna elementum vulputate. Fusce id congue lacus. Aliquam '
      'non rhoncus sapien. Mauris id orci et ipsum accumsan porttitor. Proin '
      'diam lacus, pharetra nec ligula dictum, consequat tristique nisi.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  color: const Color(0xffEFF0F0),
                  height: MediaQuery.of(context).size.height / 2.3,
                  width: double.maxFinite,
                  child: const Icon(
                    Icons.image,
                    size: 150,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ramni Chair',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 3.0),
                                  child: Text('4.5'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '\$ 1000',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  controller: tabController,
                  indicatorColor: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  labelPadding: const EdgeInsets.only(bottom: 7),
                  tabs: const [
                    Text(
                      'Description',
                    ),
                    Text('Reviews'),
                    Text(
                      'Offers',
                    ),
                    Text('Policy'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Text(
                        dummyData,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(dummyData),
                      Text(dummyData),
                      Text(dummyData),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.maxFinite,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[2],
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.remove_circle_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(double.maxFinite),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Add to cart'.toUpperCase(),
                          ),
                          const Icon(Icons.add_shopping_cart_outlined)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
