part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage(
      {super.key,
      this.title = 'Title',
      this.subtitle = 'Subtitle',
      this.bgColor,
      this.onBackButtonPressed,
      this.child});

  final String title;
  final String subtitle;
  final Color? bgColor;
  final Function? onBackButtonPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: bgColor ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPressed != null) {
                                      onBackButtonPressed!();
                                    }
                                  },
                                  child: Container(
                                    width: defaultMargin,
                                    height: defaultMargin,
                                    margin: const EdgeInsets.only(right: 26),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/back_arrow.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(title, style: blackFontStyle1,),
                              Text(subtitle, style: blackFontStyle2,),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container (
                  height: defaultMargin,
                  width: double.infinity,
                  color: 'FAFAFC'.toColor(),
                ),
                child ?? const SizedBox() ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
