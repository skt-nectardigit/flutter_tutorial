import 'package:flutter/material.dart';

import '../pages/about_us_page.dart';
import '../pages/my_homepage.dart';
import '../pages/sign_up_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Shrawan"),
            accountEmail: const Text("skt@gmail.com"),
            currentAccountPicture:
            CircleAvatar(child: Image.asset('assets/drawables/man.png')),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              subtitle: const Text("This is homepage"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("About Us"),
            subtitle: const Text("Read about us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutWebviewPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text("Contact Us"),
            subtitle: const Text("Contact Us through different mediums"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Sign In"),
            subtitle: const Text("Login to get more details"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text("Sign Up"),
            subtitle: const Text("Register to get more details"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
          ),
        ],
      ),
    );
  }
}
