import 'package:domain_layer/entities/joke.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JokesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Joke> jokes =
        Get.arguments ?? [Joke(0, "Something is missing here.")];
    return Scaffold(
      appBar: AppBar(
        title: Text("Praxis"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                jokes[index].jokeText,
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
