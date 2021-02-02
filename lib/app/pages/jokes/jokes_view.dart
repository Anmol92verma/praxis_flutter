import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/app/pages/jokes/jokes_controller.dart';
import 'package:praxis_flutter/domain/entities/joke.dart';
import 'package:praxis_flutter/locator.dart';

class JokesPage extends View {
  final List<Joke> jokes;
  final controller = locator<JokesController>();

  JokesPage(this.jokes) {
    controller.jokes = jokes;
  }

  @override
  State<StatefulWidget> createState() => _JokesPageView(controller);
}

class _JokesPageView extends ViewState<JokesPage, JokesController> {
  _JokesPageView(JokesController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Praxis"),
      ),
      body: Container(
        child: ControlledWidgetBuilder<JokesController>(
          builder: (context, controller) {
            return ListView.builder(
              itemCount: controller.jokes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    controller.jokes[index].jokeText,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
