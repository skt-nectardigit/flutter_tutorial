import 'package:flutter/material.dart';
import '../cubit/internet_cubit/internet_cubit.dart';
import '../widgets/my_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.Connected) {
                return MyListView(data: data);
              } else if (state == InternetState.Disconnected) {
                return const Text("Disconnected");
              } else {
                return const Text("Loading...");
              }
            }, listener: (context, state) {
          if (state == InternetState.Connected) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Connected"),
              backgroundColor: Colors.green,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Disconnected"),
              backgroundColor: Colors.red,
            ));
          }
        }),
      ),
    );
  }

  getData() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }
}

class MyListView extends StatefulWidget {
  final data;
  const MyListView({Key? key, required this.data}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.data != null
            ? ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(widget.data[index]['title']),
              leading: Image.network(widget.data[index]['url']),
              onTap: () {
                gotoDetail(widget.data[index]['title'].toString(),
                    widget.data[index]['url'].toString());
              },
            );
          },
          itemCount: widget.data.length,
        )
            : const CircularProgressIndicator());
  }

  gotoDetail(String title, String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              url: url,
            )));
  }
}
