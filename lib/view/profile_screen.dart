import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
import 'package:mobile_capstone_fpt/config/provider/login_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/widgets/date_input_field.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/widgets/text_input.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = "";
  String email = "";
  DateTime? dob;
  void inputFullName(String a) {
    setState(() {
      fullName = a;
    });
  }

  void inputEmail(String b) {
    setState(() {
      email = b;
    });
  }

  void inputDob(String c) {
    setState(() {
      DateTime date = DateTime.parse(c);
      dob = date;
    });
  }

  File? _image;
  Future pickImg() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, '/HomePage', (route) => false);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Thông tin',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            GestureDetector(
              child: const Icon(
                Icons.check,
                size: 30,
              ),
              onTap: () {
                if (fullName.isEmpty && dob == null && email.isEmpty) {
                  showToastFail('Không có thông tin mới');
                } else {
                  if (fullName.isEmpty) {
                    fullName = profileProvider.info.result!.profile.fullName;
                  }
                  if (dob == null) {
                    dob = DateTime.parse(
                        profileProvider.info.result!.profile.dob);
                  }
                  if (email.isEmpty) {
                    email = profileProvider.info.result!.profile.email;
                  }
                  profileProvider.updateProfile(context, fullName, dob, email);
                }
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: kPrimaryLightColor,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Positioned(
              Container(
                padding: EdgeInsets.only(top: 5, left: size.width - 50),
                height: 120,
                width: size.width,
                color: kBackgroundColor,
              ),
              // Positioned(
              //     top: 50,
              //     left: size.width / 2 - 65,
              //     child: Container(
              //       height: 130,
              //       width: 130,
              //       decoration: BoxDecoration(
              //           // color: Colors.greenAccent,
              //           borderRadius: BorderRadius.circular(100),
              //           image: DecorationImage(
              //               // image: AssetImage('assets/images/fakelogo.png'),
              //               image: NetworkImage(
              //                   profileProvider.info.result!.profile.avatar),
              //               fit: BoxFit.fill)),
              //     )),
              Positioned(
                  top: 50,
                  left: size.width / 2 - 65,
                  child: GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Thay đổi ảnh đại diện"),
                              // content: Text(contentText),
                              content: _image != null
                                  ? Image.file(
                                      _image!,
                                      height: 130,
                                      width: 130,
                                    )
                                  : SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: Icon(Icons.image),
                                    ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        pickImg();
                                      });
                                    },
                                    child:
                                        const Icon(Icons.file_upload_outlined)),
                                TextButton(
                                  onPressed: () {
                                    profileProvider.updateAvatar(
                                        context, _image!);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Lưu"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "Hủy",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                  profileProvider.info.result!.profile.avatar),
                              fit: BoxFit.fill)),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  // color: kPrimaryLightColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        TextInput(
                            textValue: inputFullName,
                            hintText:
                                profileProvider.info.result!.profile.fullName,
                            textCapitalization: TextCapitalization.words),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 350,
                          child: Row(
                            children: [
                              phoneFlag(),
                              const SizedBox(
                                width: 17,
                              ),
                              phoneText(profileProvider.info.result!.phone),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DateInputField(
                          input: inputDob,
                          date: profileProvider.info.result!.profile.dob,
                        ),
                        // DateInputField(),
                        const SizedBox(
                          height: 15,
                        ),
                        TextInput(
                            textValue: inputEmail,
                            hintText:
                                profileProvider.info.result!.profile.email,
                            textCapitalization: TextCapitalization.words),
                        SizedBox(
                          height: 35,
                        ),
                        // UnderPart(title: 'Đổi mật khẩu', navigatorText: navigatorText, onTap: onTap)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: size.height - 220,
                  child: Container(
                    height: 100,
                    width: size.width,
                    child: Column(
                      children: [
                        UnderPart(
                            title: '',
                            navigatorText: 'Đổi mật khẩu',
                            onTap: () {
                              Navigator.pushNamed(context, '/changePassword');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: const Text(
                            'Đăng Xuất',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            loginProvider.logout(context);
                            Navigator.pushNamed(context, '/LoginPage');
                          },
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneText(String phone) => Container(
      width: 220,
      height: 58,
      padding: const EdgeInsets.only(top: 20, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withOpacity(0.13)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Text(phone,
          style: const TextStyle(fontSize: 16, color: Colors.grey)));

  Widget phoneFlag() => Container(
        width: 113,
        height: 58,
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withOpacity(0.13)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                // input(number.phoneNumber!);
              },
              countries: const ['VN'],
              initialValue: PhoneNumber(isoCode: 'VN', dialCode: ''),
              ignoreBlank: false,
              locale: '',
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              formatInput: false,
              isEnabled: true,
            ),
          ],
        ),
      );
}
