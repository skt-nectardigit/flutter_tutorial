import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_homepage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const  EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                /*errorText: 'Error message',*/
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                /*errorText: 'Error message',*/
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.phone,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock)
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));

              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text("SIGN UP"),
            )
          ],
        ),
      ),
    );
  }
}
