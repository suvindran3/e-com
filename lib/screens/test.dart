import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
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
            expandedHeight: MediaQuery.of(context).size.height / 2.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xffEFF0F0),
                height: MediaQuery.of(context).size.height / 2.3,
                width: double.maxFinite,
                child: const Icon(
                  Icons.image,
                  size: 150,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                PageView(
                  
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
