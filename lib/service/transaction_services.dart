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

    return ApiReturnValue(value: transaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client? client}) async {
    // await Future.delayed(const Duration(seconds: 2));
    client ??= http.Client();

    String url = '$baseURL/checkout';

    print("URL Submit Transaction : $url");

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${User.token}'
        },
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food!.id,
          'user_id': transaction.user!.id,
          'quantity': transaction.quantitiy,
          'total': transaction.total,
          'status': 'PENDING',
        }));

    print('Response Submit Transaction : ${response.body}');

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed To Submit Transaction');
    }

    var data = jsonDecode(response.body);

    Transaction submit = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: submit);
  }
}
