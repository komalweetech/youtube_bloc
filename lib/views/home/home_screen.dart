import 'package:flutter/material.dart';
import 'package:youyube_bloc/config/routes/routes_name.dart';
import 'package:youyube_bloc/services/storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor:  Colors.blueGrey.shade700,
        title: const Text('Home',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {
            LocalStorage localStorage = LocalStorage();

            localStorage.clearValue('token').then((value) {
              localStorage.clearValue('isLogin');

              Navigator.pushNamed(context, RoutesName.loginScreen);
            });
          },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
