import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenang_flutter_test/login/screens/login_page.dart';
import 'package:tenang_flutter_test/profile/bloc/profile_bloc.dart';

class ProfilePrep extends StatelessWidget {
  const ProfilePrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetDataEvent()),
      child: ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if(state is SignOutSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return const LoginPrep();
          }));
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state is GetDataState) {
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProfileBloc>().add(UpdateProfilePicEvent());
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: context.read<ProfileBloc>().profilepicture!=null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(context.read<ProfileBloc>().profilepicture),
                            )
                                : Icon(Icons.person, size: 24,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          context.read<ProfileBloc>().name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text('Email'),
                        ),
                        Text(':'),
                        Expanded(
                          child: Text(
                            context.read<ProfileBloc>().email,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text('Phone Number'),
                        ),
                        Text(':'),
                        Expanded(
                          child: Text(
                            context.read<ProfileBloc>().phonenum.isEmpty
                                ? 'Not set'
                                : context.read<ProfileBloc>().phonenum,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                      ),
                      onPressed: () {
                        context.read<ProfileBloc>().add(SignOutEvent());
                      },
                      child: Text('Log Out'),
                    ),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      )
    );
  }
}
