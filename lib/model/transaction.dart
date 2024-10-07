part of 'models.dart';

enum TransactionStatus {
  delivered,
  on_delivery,
  pending,
  canceled,
}

class Transaction extends Equatable {
  final int? id;
  final Food? food;
  final int? quantitiy;
  final int? total;
  final DateTime? dateTime;
  final TransactionStatus? status;
  final User? user;
  final String? paymentUrl;

  Transaction({
    this.id,
    this.food,
    this.quantitiy,
    this.total,
    this.dateTime,
    this.status,
    this.user,
    this.paymentUrl,
  });

  Transaction copyWith({
    int? id,
    Food? food,
    int? quantitiy,
    int? total,
    DateTime? dateTime,
    TransactionStatus? status,
    User? user,
  }) {
    return Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantitiy: quantitiy ?? this.quantitiy,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
      id: data['id'],
      food: Food.fromJson(data['food']),
      quantitiy: data['quantitiy'],
      total: data['total'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      user: User.fromJson(data['user']),
      paymentUrl: data['payment_url'],
      status: data['status'] == 'PENDING' ? TransactionStatus.pending :
              data['status'] == 'ON_DELIVERY' ? TransactionStatus.on_delivery :
              data['status'] == 'CANCELED' ? TransactionStatus.canceled :
              TransactionStatus.delivered

      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        food,
        quantitiy,
        total,
        dateTime,
        status,
        user,
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantitiy: 5,
    total: (mockFoods[1].price! * 5 * 1.1).toInt() + 5000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[5],
    quantitiy: 2,
    total: (mockFoods[5].price! * 2 * 1.1).toInt() + 5000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockFoods[9],
    quantitiy: 3,
    total: (mockFoods[9].price! * 3 * 1.1).toInt() + 5000,
    dateTime: DateTime.now(),
    status: TransactionStatus.pending,
    user: mockUser,
  ),
];
