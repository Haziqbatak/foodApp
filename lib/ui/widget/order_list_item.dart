part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.transaction,
    required this.itemWidth,
  });

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(
            right: 12,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ??
                  'https://ui-avatars.com/api/?background=random?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.food?.name ?? 'Food Name',
                      style: blackFontStyle2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text('${transaction.quantitiy} item(s) ~ '),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'IDR',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(transaction.total),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(displayConvertDateTime(transaction.dateTime!)),
                  (transaction.status == TransactionStatus.delivered)
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Delivered',
                            style:
                                blackFontStyle2.copyWith(color: Colors.white),
                          ),
                        )
                      : (transaction.status == TransactionStatus.canceled)
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'Canceled',
                                style: blackFontStyle2.copyWith(
                                    color: Colors.white),
                              ),
                            )
                          : (transaction.status == TransactionStatus.pending)
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Pending',
                                    style: blackFontStyle2.copyWith(
                                        color: Colors.white),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'On Delivery',
                                        style: blackFontStyle2.copyWith(
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.motorcycle,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
