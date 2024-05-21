import 'dart:convert';

import 'package:api/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API demo app",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            // final name=user.name;
            // final namevitratl = name['title'];
            // final namevitrafn = name['first'];
            // final namevitraln = name['last'];
            // final imageUrl=user['picture']['thumbnail'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  // leading: ClipRRect(
                  //   borderRadius: BorderRadius.circular(100),

                  //   child: Image.network(imageUrl)),
                  // title: Text("${namevitratl} ${namevitrafn} ${namevitraln}",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(user.email),
                  title: Text(user.name.first),
                  trailing: Text(user.gender),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        child: Icon(Icons.refresh),
      ),
    );
  }

  void fetchUser() async {
    print("first");
    const url = "https://randomuser.me/api/?results=50";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;

    final transform = result.map((e) {
      final name = Username(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name : name);
    }).toList();
    setState(() {
      users = transform;
    });
    print("second");
  }
}
