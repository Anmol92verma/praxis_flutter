import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praxis_flutter/app/components/praxis_button.dart';
import 'package:praxis_flutter/app/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Praxis"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Visibility(
                  child: LinearProgressIndicator(),
                  visible: controller.isLoading.value,
                )),
            SizedBox(height: 30),
            Text(
              "Chuck Norris Random Joke Generator",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 50),
            PraxisButton(
              text: "Show 5 Random Jokes",
              onPressed: () => controller.getJokes(),
            )
          ],
        ),
      ),
    );
  }
}
