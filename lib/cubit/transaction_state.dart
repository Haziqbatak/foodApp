part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoaded extends TransactionState{
  final List<Transaction> transactions;

  TransactionLoaded(this.transactions);

  @override
  // TODO: implement props
  List<Object?> get props => [transactions];
}

final class TransactionLoadedFailed extends TransactionState{
  final String message;

  TransactionLoadedFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
