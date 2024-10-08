part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.transaction});

  final Transaction? transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Order',
                  style: blackFontStyle3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    // Food Information
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(widget.transaction!.food!.picturePath!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(widget.transaction?.food?.name ?? 'No Name',
                            style: blackFontStyle2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            symbol: 'IDR ',
                            decimalDigits: 0,
                            locale: 'id_ID',
                          ).format(
                            widget.transaction?.food?.price ?? 0,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction?.quantitiy} item(s)',
                        textAlign: TextAlign.end,
                        style: greyFontStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                // Detail Transaction
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Details Transaction',
                  style: blackFontStyle3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                // Food's Name
                Row(
                  children: [
                    Text(
                      widget.transaction?.food?.name ?? 'No Name',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction?.food?.price ?? 0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                // Quantity
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text('${widget.transaction!.quantitiy.toString()} Item(s)'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                // Quantity
                Row(
                  children: [
                    Text(
                      'Sub Total',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id_ID',
                    ).format(
                        widget.transaction?.food?.price ?? 0 * widget.transaction!.quantitiy!)),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction?.food?.price ?? 0 *
                          widget.transaction!.quantitiy! *
                          0.1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Fee',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction?.total ?? 0),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: blackFontStyle2,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction!.total),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Deliver to:',
                  style: blackFontStyle3,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'Nama Penerima',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.name ?? 'no name',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'Email Penerima',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.email ?? 'Name',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.phoneNumber ?? 'texr',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'Address',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.address ?? 'name',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'House Number',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.houseNumber ?? 'name',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'City',
                      style: blackFontStyle3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction?.user?.city ?? 'anea',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      var paymentUrl = await context.read<TransactionCubit>().submitTransaction(
                        widget.transaction!.copyWith(
                            dateTime: DateTime.now(),
                            total: (widget.transaction!.total! * 1.1).toInt() + 50000,
                        )
                      );
                      if(paymentUrl != null){
                        Get.to(PaymentMethodPage(paymentUrl: paymentUrl,));
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
                            'Transaction Failed',
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
                      }
                    },
                    child: Text(
                      'Order Now',
                      style: blackFontStyle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
