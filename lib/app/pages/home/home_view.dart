import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/app/components/praxis_button.dart';
import 'package:praxis_flutter/app/pages/home/bloc/jokes_cubit.dart';
import 'package:praxis_flutter/locator.dart';
import 'package:praxis_flutter/routing/nav.dart';
import 'package:praxis_flutter/routing/route_names.dart';
import 'package:praxis_flutter/utils/ui_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokesCubit>(
      create: (context) => locator<JokesCubit>(),
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
            BlocConsumer<JokesCubit, JokesState>(
              listener: (context, state) {
                if (state is JokesLoaded) {
                  locator<Nav>().goTo(jokesRoute, argument: state.jokes);
                } else if (state is JokesError) {
                  showMessage(context, state.message);
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
              onPressed: () => context.read<JokesCubit>().getJokes(),
            )
          ],
        ),
      ),
    );
  }
}
