import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vti_express/ui/login_page/widget/build_text_wrong.dart';

import '../../../common/build_widget.dart';
import '../../change_company/change_company_page.dart';
import '../../forgot_password/forgot_password_bottom_sheet.dart';
import 'build_login_button.dart';
import 'build_password_texfield.dart';
import 'bulid_username_textfield.dart';

class BuildForm extends StatefulWidget {
  const BuildForm({Key? key}) : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildImageLogo('assets/images/logo.png'),
              const BuildUserNameTextField(),
              const BuildPasswordTextField(),
              const BuildTextWrong(),
              CustomTextButton(
                text: 'Quên mật khẩu',
                builder: const ForgotPasswordBottomSheet(),
              ),
              const SizedBox(
                height: 60,
                  child:BuildLoginButton()),
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height / 5,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ChangeCompanyPage()),
                        (route) => false);
                  },
                  child: Text(
                    'Thay đổi công ty?',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 14, color: Colors.blueAccent)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _buildImageLogo(String s) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(110, 50, 110, 50),
      child: Image.asset(s),
    );
  }
}
