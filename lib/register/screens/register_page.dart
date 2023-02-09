import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';
import 'package:tenang_flutter_test/register/bloc/register_bloc.dart';

class RegisterPrep extends StatelessWidget {
  const RegisterPrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterPage(),
    );
  }
}


class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if(state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return LoginPrep();
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text('Account Created!'),
            ),
          );
        }
        if(state is RegisterFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: context.read<RegisterBloc>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 39,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios_new_rounded),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4E4B66)
                              ),
                            ),
                            Text(
                              'create new account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8A8D9F),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 32,),
                    TextFormField(
                      controller: context.read<RegisterBloc>().fullnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F5F7),
                        hintText: 'Full name',
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: context.read<RegisterBloc>().emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F5F7),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      obscureText: true,
                      controller: context.read<RegisterBloc>().passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F5F7),
                        hintText: 'Password',
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Checkbox(
                              value: context.read<RegisterBloc>().agreement,
                              onChanged: (value) {
                                setState(() {
                                  context.read<RegisterBloc>().agreement = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('By creating an account you agree to'),
                        )
                      ],
                    ),
                    Text(
                      'our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 0.6
                      ),
                    ),
                    SizedBox(height: 17,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 50),
                          backgroundColor: Color(0xFF4A80FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )
                      ),
                      onPressed: () {
                        context.read<RegisterBloc>().add(RegisterSubmitEvent());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontWeight: FontWeight.w400
                  ),
                ),
                InkWell(
                  child: Text(
                    'Sign in!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4A80FF),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
