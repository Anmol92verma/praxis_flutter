import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/app/components/praxis_button.dart';
import 'package:praxis_flutter/app/pages/home/bloc/jokes_bloc.dart';
import 'package:praxis_flutter/app/pages/jokes/jokes_view.dart';
import 'package:praxis_flutter/locator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokesBloc>(
      create: (context) => locator<JokesBloc>(),
      child: _HomePageLayout(),
    );
  }
}

class _HomePageLayout extends StatelessWidget {
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
            BlocConsumer<JokesBloc, JokesState>(
              listener: (context, state) {
                if (state is JokesLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokesPage(state.jokes),
                    ),
                  );
                } else if (state is JokesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is JokesLoading)
                  return LinearProgressIndicator();
                else
                  return Container();
              },
            ),
            SizedBox(height: 30),
            Text(
              "Chuck Norris Random Joke Generator",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 50),
            PraxisButton(
              text: "Show 5 Random Jokes",
              onPressed: () => context.read<JokesBloc>().add(GetJokes()),
            )
          ],
        ),
      ),
    );
  }
}
