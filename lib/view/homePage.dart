import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await signOut();
                },
                icon: Icon(Icons.logout)),
          ],
        ),

        // ✅ Drawer with FutureBuilder
        drawer: Drawer(
          child: FutureBuilder<DocumentSnapshot>(
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
              var data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${data['username']} ,What fruits salad \ncombo do you want today",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: search,
                      decoration: InputDecoration(
                        
                        fillColor: const Color.from(
                            alpha: 0.966,
                            red: 0.922,
                            green: 0.914,
                            blue: 0.914),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
