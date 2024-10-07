part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transactions.isEmpty) {
          return IllustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems like you have not\nordered any food yet',
            picturePath: 'assets/food_wishes.png',
            buttonTitle1: 'find foods',
            buttonTap1: () {},
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return ListView(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: defaultMargin),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 15,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Orders.",
                      style: blackFontStyle2,
                    ),
                    Text(
                      "Wait for your orders.",
                      style: blackFontStyle3,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Tabbar(
                      selectedIndex: selectedIndex,
                      titles: const ["In Progress", "Past Orders"],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Builder(builder: (_) {
                      List<Transaction> transactions = (selectedIndex == 0
                          ? mockTransaction
                              .where((e) =>
                                  e.status == TransactionStatus.delivered ||
                                  e.status == TransactionStatus.canceled)
                              .toList()
                          : mockTransaction
                              .where((e) =>
                                  e.status == TransactionStatus.delivered ||
                                  e.status == TransactionStatus.canceled)
                              .toList());
                      return Column(
                        children: transactions
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OrderListItem(
                                    transaction: e, itemWidth: listItemWidth),
                              ),
                            )
                            .toList(),
                      );
                    }),
                  ],
                ),
              )
            ],
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
