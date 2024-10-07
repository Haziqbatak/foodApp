part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = '$baseURL/transaction';

    print("URL Transaction : $url");

    var response = await client.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${User.token}'
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed to get Transactions');
    }

    var data = jsonDecode(response.body);

    print("Data Transaction : $data");

    List<Transaction> transaction = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiReturnValue(
        value: transaction.copyWith(
      id: 123,
      status: TransactionStatus.pending,
      total: (transaction.quantitiy! + transaction.food!.price! + 1.1).toInt(),
    ));
  }
}
