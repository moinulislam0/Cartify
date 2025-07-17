import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_method/widgets/Card.dart';
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
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ],
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          }),
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

        // ✅ Body showing same user data (optional)
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello ${data?['username']} ,What fruits salad \ncombo do you want today",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: search,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Recommeded Combo",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CardWidgets(
                            category: "Nothing",
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Categories(),
                    ],
                  ),
                ),
              );
            }));
  }
}
