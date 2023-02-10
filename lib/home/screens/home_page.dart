import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_flutter_test/home/bloc/home_bloc.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';

class HomePrep extends StatelessWidget {
  const HomePrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {

      },
      child: Center(
        child: Text('Home Page'),
      )
    );
  }
}
