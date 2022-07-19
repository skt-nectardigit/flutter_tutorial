import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  final String title,url;
  const DetailPage({Key? key, required this.title,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page'),),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(url),
                    ),
                    const SizedBox(height: 20,),
                    Text(title)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
