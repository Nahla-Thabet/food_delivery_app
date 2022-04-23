import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_states.dart';
import 'package:mega_trust_project/features/Auth/presentation/screens/LoginScreen.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/screens/jobs_list_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().getToken();
    return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
      state.maybeWhen(
          login: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  JobsListScreen())),
          logout: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen() )),

          orElse: (){
            print(state.toString());

          });
    },
        child: const Scaffold(
          body: CircularProgressIndicator(),
        )
    );
  }
}
