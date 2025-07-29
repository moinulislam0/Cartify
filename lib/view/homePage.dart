import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/controller/SmartphoneController.dart';
import 'package:practice_method/controller/beautyController.dart';
import 'package:practice_method/controller/categoriesController.dart';
import 'package:practice_method/widgets/BeautyWidgets.dart';
import 'package:practice_method/widgets/Categories.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController search = TextEditingController();
  Future<DocumentSnapshot> getData() async {
    return await FirebaseFirestore.instance
        .collection('userdata')
        .doc(user.uid)
        .get();
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<Categoriescontroller>().getCategories();
    Get.find<Smartphonecontroller>().getSmartphone();
    Get.find<Beautycontroller>().getBeauty();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
                onPressed: () async {
                  await signOut();
                },
                icon: Icon(Icons.logout, color: Colors.white)),
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white),
              );
            },
          ),
        ),
        drawer: Drawer(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.blue));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text("Error loading user data",
                        style: TextStyle(color: Colors.black)));
              } else if (!snapshot.hasData || !snapshot.data!.exists) {
                return Center(
                    child: Text("User not found",
                        style: TextStyle(color: Colors.black)));
              }
              var userdata = snapshot.data!;
              return ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.pink),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            '', // Fallback image
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${userdata['username']}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${user.email}',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    onTap: () async => await signOut(),
                  ),
                ],
              );
            },
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data!;
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  // Greeting text
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome ${data['username'] ?? ''},visit the site and Choice Your products..",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  // Sticky Search Bar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SearchBarDelegate(search),
                  ),
                  // Recommended Combo title
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: GetBuilder<Categoriescontroller>(
                        builder: (categoryCtrl) {
                          final categoryList =
                              categoryCtrl.categoriesModel.categories;

                          return Text(
                            categoryList.isNotEmpty
                                ? categoryList[0].name ?? 'Unnamed'
                                : 'No Categories',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ),

                  // Grid content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          GetBuilder<Beautycontroller>(builder: (controller) {
                        final productList =
                            controller.beautyModel.products ?? [];
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .65,
                          ),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final product = productList.isNotEmpty
                                ? productList[index]
                                : null;
                            return Beautywidgets(item: product);
                          },
                        );
                      }),
                    ),
                  ),

                  // Categories title
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),

                  // Categories widget
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Categories(),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

// ✅ Sticky SearchBar Delegate
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;

  _SearchBarDelegate(this.controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
