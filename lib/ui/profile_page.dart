part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: defaultMargin),
          margin: const EdgeInsets.only(bottom: defaultMargin),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(bottom: defaultMargin),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded)}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                (context.read<UserCubit>().state as UserLoaded).user.name ??
                    'Name',
                style: blackFontStyle1,
              ),
              Text(
                (context.read<UserCubit>().state as UserLoaded).user.email ??
                    'email',
                style: greyFontStyle,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 320,
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              Tabbar(
                selectedIndex: selectedIndex,
                titles: const ["Account", "Food Market"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              (selectedIndex == 0) ? const AccountTab() : const FoodMarketTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    void refresh() {
      context
          .read<UserCubit>()
          .getUser((context.read<UserCubit>().state as UserLoaded).user);
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(const EditProfilePage())!.then((value) => refresh());
          },
          child: const RowTab(title: 'Edit Profile'),
        ),
        const RowTab(title: 'Home Address'),
        const RowTab(title: 'Security'),
        const RowTab(title: 'Payments'),
        GestureDetector(
          onTap: () {
            context.read<UserCubit>().signOut();
            Get.to(const SignInPage());
          },
          child: const Text("Sign Out"),
        ),
      ],
    );
  }
}

class FoodMarketTab extends StatelessWidget {
  const FoodMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RowTab(title: 'Rate App'),
        RowTab(title: 'Help Center'),
        RowTab(title: 'Privact & Policy'),
        RowTab(title: 'Term & Conditions'),
      ],
    );
  }
}

class RowTab extends StatelessWidget {
  const RowTab({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackFontStyle2,
        ),
        Icon(
          MdiIcons.chevronRight,
          color: mainColor,
          size: 40,
        )
      ],
    );
  }
}
