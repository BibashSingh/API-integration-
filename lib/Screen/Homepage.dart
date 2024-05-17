import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API demo app"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user['email'];
            final gender=user['gender'];
            final name=user['name'];
            final namevitratl = name['title'];
            final namevitrafn = name['first'];
            final namevitraln = name['last'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                
                child: ListTile(
                  leading: CircleAvatar(child: Text("${index+1}")),
                  title: Text("${namevitratl} ${namevitrafn} ${namevitraln}",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(email),
                  trailing: Text(gender),
                
                
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
    setState(() {
      users = json['results'];
    });
    print("second");
  }
}
