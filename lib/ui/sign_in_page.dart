part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: 'Sign In',
        subtitle: 'Find your best ever meal',
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                defaultMargin,
                10,
                defaultMargin,
                6,
              ),
              child: Text(
                'Email Address',
                style: blackFontStyle2,
              ),
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your email address',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                defaultMargin,
                10,
                defaultMargin,
                6,
              ),
              child: Text(
                'Password',
                style: blackFontStyle2,
              ),
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
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your password',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await context.read<UserCubit>().signIn(
                              emailController.text,
                              passwordController.text,
                            );
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
                        'Login',
                        style: blackFontStyle3.copyWith(color: Colors.white),
                      ),
                    ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: blackFontStyle3.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
