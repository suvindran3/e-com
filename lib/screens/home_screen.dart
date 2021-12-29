import 'package:ecom/elements/bottom_nav_bar.dart';
import 'package:ecom/elements/product_section.dart';
import 'package:ecom/elements/sidebar_animation.dart';
import 'package:ecom/elements/sidebar.dart';
import 'package:ecom/state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final UniqueKey closeKey = UniqueKey();
  final UniqueKey openKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SidebarAnimation(
      sidebar: (controller) => Sidebar(controller: controller),
      mainScreen: (controller) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const BottomNavBar(),
            AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height - 85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius:
                    BlocProvider.of<StateCubit>(context, listen: true).state
                        ? BorderRadius.circular(25)
                        : const BorderRadius.vertical(
                            bottom: Radius.circular(25),
                          ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Center(
                                child: IconButton(
                                  icon: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    switchInCurve: Curves.easeInOutCubic,
                                    switchOutCurve: Curves.easeInOutCubic,
                                    transitionBuilder: (child, animation) =>
                                        RotationTransition(
                                      turns: animation,
                                      child: child,
                                    ),
                                    child: !BlocProvider.of<StateCubit>(context)
                                            .state
                                        ? const Icon(
                                            Icons.segment_outlined,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.close,
                                            key: closeKey,
                                            color: Colors.black,
                                          ),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<StateCubit>(context)
                                        .sideBar();
                                    controller.status == AnimationStatus.completed
                                        ? controller.reverse()
                                        : controller.forward();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.notifications_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const Expanded(
                                child: TextField(
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Color(0xffBBBFD7),
                                    ),
                                    fillColor: Color(0xffF6F7FA),
                                    prefixIcon: Icon(
                                      Icons.search_sharp,
                                      color: Colors.black45,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Material(
                                color: const Color(0xffF6F7FA),
                                borderRadius: BorderRadius.circular(4),
                                child: IconButton(
                                  onPressed: () {},
                                  color: Colors.black45,
                                  icon: const Icon(Icons.filter_alt_outlined),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProductSection(
                        categoryList: false,
                        sectionName: 'Trending Products',
                      ),
                      const ProductSection(
                        categoryList: true,
                        sectionName: 'Popular Categories',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



