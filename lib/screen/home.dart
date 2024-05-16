import 'package:flutter/material.dart';
import 'package:rest_api_project/model/user.dart';
import 'package:rest_api_project/services/user_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final phone = user.phone;
          final icon = user.gender == 'male' ? Icons.male : Icons.female;
          final name = user.fullName;
          final dob = user.dob.date;
          final location = user.location.postcode;
          return ListTile(
            leading: Icon(icon),
            title: Text(name),
            subtitle: Text(location),
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();

    setState(() {
      users = response;
    });
  }
}
