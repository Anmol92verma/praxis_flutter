import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/app/pages/home/home_controller.dart';
import 'package:praxis_flutter/locator.dart';

class HomePage extends View {
  final controller = locator<HomeController>();

  @override
  State<StatefulWidget> createState() => _HomePageView(controller);
}

class _HomePageView extends ViewState<HomePage, HomeController> {
  _HomePageView(HomeController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Praxis"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ControlledWidgetBuilder<HomeController>(
              builder: (context, controller) {
                return Visibility(
                  child: LinearProgressIndicator(),
                  visible: controller.isLoading,
                );
              },
            ),
            SizedBox(height: 30),
            Text(
              "Chuck Norris Random Joke Generator",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 50),
            ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) {
              return PraxisButton(
                text: "Show 5 Random Jokes",
                onPressed: controller.getJokes,
              );
            })
          ],
        ),
      ),
    );
  }
}

class PraxisButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PraxisButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(text),
      textColor: Colors.white,
      color: Theme.of(context).buttonColor,
      onPressed: onPressed,
    );
  }
}
