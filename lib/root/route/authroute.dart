import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_flutter_test/home/screens/home_page.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';
import 'package:tenang_flutter_test/root/bloc/auth_bloc.dart';

class AppAuthProvider extends StatelessWidget {
  const AppAuthProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthRoute()),
        ),
      ],
      child: AppAuth(),
    );
  }
}

class AppAuth extends StatelessWidget {
  const AppAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthFailed) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return const LoginPrep();
          }));
        }
        if(state is AuthSuccess) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return HomePrep();
          }));
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white.withOpacity(1.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

