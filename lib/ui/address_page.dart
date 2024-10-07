part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage(
      {super.key,
      required this.user,
      required this.password,
      required this.pictureFile});

  final User user;
  final String password;
  final File pictureFile;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;
  List<String>? cities;
  String? selectedCity;

  @override
  void initState() {
    cities = ['Jakarta', 'Bandung', 'Semarang', 'Jogja', 'Surabaya'];
    selectedCity = cities![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Profile',
      subtitle: 'Make sure it valid',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          // Address
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
            child: Text(
              'Address',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your address',
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // Phone Number
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              'Phone Number',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your phone number',
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // House Number
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              'House Number',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your house number',
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // City
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              'City',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: DropdownButton(
              value: selectedCity,
              items: cities!
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
              isExpanded: true,
              underline: const SizedBox(),
            ),
          ),
          // Continue
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: (isLoading == true)
                ? loadingIndicator
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          address: addressController.text,
                          phoneNumber: phoneNumberController.text,
                          houseNumber: houseNumberController.text,
                          city: selectedCity);

                      setState(() {
                        isLoading = true;
                      });

                      await context.read<UserCubit>().signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);
                      UserState state = context.read<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransactions();
                        Get.to(() => const MainPage());
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
                    child: Text(
                      'Create Account',
                      style: blackFontStyle3.copyWith(color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
