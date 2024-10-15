import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:food_app/cubit/cubit.dart';
import 'package:food_app/main.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';
import 'package:food_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name!;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber!;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber!;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address!;
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).user.city!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
        ),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Change Your Name',
                  style: blackFontStyle2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'Type your name',
                    ),
                  ),
                ),
                Text(
                  'Change Your Phone Number',
                  style: blackFontStyle2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'Change your phone number',
                    ),
                  ),
                ),
                Text(
                  'Change your house number',
                  style: blackFontStyle2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: houseNumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'Change your house number',
                    ),
                  ),
                ),
                Text(
                  'Change your address',
                  style: blackFontStyle2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'Change your address',
                    ),
                  ),
                ),
                Text(
                  'Change your city',
                  style: blackFontStyle2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'Change your city',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: (isLoading == true)
                      ? loadingIndicator
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            User user =
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .copyWith(
                                      name: nameController.text,
                                      phoneNumber: phoneNumberController.text,
                                      houseNumber: houseNumberController.text,
                                      address: addressController.text,
                                      city: cityController.text,
                                    );

                            ApiReturnValue<User> result =
                                await UserServices.updateProfile(user);

                            if (result.value != null) {
                              context.read<UserCubit>().getUser(result.value!);
                              Get.snackbar(
                                '',
                                '',
                                backgroundColor: '2ECC71'.toColor(),
                                icon: const Icon(
                                  MdiIcons.closeCircleOutline,
                                  color: Colors.white,
                                ),
                                titleText: Text(
                                  'Update profile success',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                messageText: Text(
                                  'Your Profile has been updated',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });

                              Get.back();
                            } else {
                              Get.snackbar(
                                '',
                                '',
                                backgroundColor: 'D9435E'.toColor(),
                                icon: const Icon(
                                  MdiIcons.closeCircleOutline,
                                  color: Colors.white,
                                ),
                                titleText: Text(
                                  'Sign In Failed',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                messageText: Text(
                                  'Please try again later',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greyColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            'Done',
                            style:
                                blackFontStyle3.copyWith(color: Colors.white),
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
