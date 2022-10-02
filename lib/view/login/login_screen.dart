import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
import 'package:mobile_capstone_fpt/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          color: Color(0xffffcc33),
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Upside(
                  imgUrl: 'assets/images/fakelogo.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: Text(
                    'MeSup',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 38,
                        shadows: [
                          BoxShadow(color: Colors.orange, blurRadius: 40)
                        ],
                        letterSpacing: 9,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PhoneInputField(),
                            const SizedBox(
                              height: 15,
                            ),
                            const PasswordInputField(hintText: 'Mật khẩu'),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonField(
                              path: '/',
                              text: 'Đăng Nhập',
                              // press: ,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            UnderPart(
                                title: 'Bạn chưa có tài khoản?  ',
                                navigatorText: 'Đăng ký',
                                onTap: () {
                                  // print('Đăng ký');
                                  Navigator.pushNamed(context, '/register');
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            UnderPart(
                                title: '',
                                navigatorText: 'Quên mật khẩu!',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/resetPassword');
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 165, right: 30),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Nhớ mật khẩu',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: Colors.white,
      onChanged: (val) {},
    ),
  );
}
