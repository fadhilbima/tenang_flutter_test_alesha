
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_flutter_test/login/bloc/login_bloc.dart';
import 'package:tenang_flutter_test/register/screens/register_page.dart';

class LoginPrep extends StatelessWidget {
  const LoginPrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return Container();
              },
            ),
          );
        }
        if(state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            )
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: context.read<LoginBloc>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 53),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 110),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'sign in to continue.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8A8D9F),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: context.read<LoginBloc>().emailController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 22, right: 18),
                              child: Icon(
                                Icons.mail_sharp,
                                color: Color(0xFF4A80FF),
                                size: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F5F7),
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          controller: context.read<LoginBloc>().passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 22, right: 18),
                                child: Image.asset('assets/icons/password_icon.png', width: 18,)
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F5F7),
                            hintText: 'Password',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Color(0xFF4A80FF)
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(MediaQuery.of(context).size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: Color(0xFF4A80FF),
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginSubmitEvent());
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        SizedBox(height: 49),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Color(0xFF8A8D9F))
                                ),
                                child: Center(
                                  child: Image.asset('assets/icons/google.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Color(0xFF8A8D9F))
                                ),
                                child: Center(
                                  child: Image.asset('assets/icons/apple.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Color(0xFF8A8D9F))
                                ),
                                child: Center(
                                  child: Image.asset('assets/icons/facebook.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 81),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(bottom: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do not have account? '),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return RegisterPrep();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign up!',
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
