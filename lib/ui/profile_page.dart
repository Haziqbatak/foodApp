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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pinimg.com/564x/6d/20/2d/6d202d38b84c6ec1011f6b3f3cf848e8.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/photo.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                mockUser.name ?? "name",
                style: blackFontStyle1.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                mockUser.email ?? "email",
                style: blackFontStyle2.copyWith(),
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
    return const Column(
      children: [
        RowTab(title: 'Edit Profile'),
        RowTab(title: 'Home Address'),
        RowTab(title: 'Security'),
        RowTab(title: 'Payments'),
        RowTab(title: 'Sign Out'),
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