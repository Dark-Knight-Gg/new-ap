import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vti_express/repository/authentication_repository.dart';
import 'package:vti_express/ui/authentication/bloc/authentication_bloc.dart';

import '../../authentication/bloc/authentication_state.dart';

class BuildTextWrong extends StatefulWidget {
  const BuildTextWrong({Key? key}) : super(key: key);

  @override
  State<BuildTextWrong> createState() => _BuildTextWrongState();
}

class _BuildTextWrongState extends State<BuildTextWrong> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context, state){
          if(state.status == AuthenticationStatus.loginFail){
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
              child: Text(
                'Đăng nhập thất bại!',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 14, color: Colors.redAccent)
                ),
              ),
            );
          }else{
            return Text(
              '',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 14, color: Colors.white)
              ),
            );
          }
        }
    );

  }
}
