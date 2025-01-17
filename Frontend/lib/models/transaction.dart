class Transaction{
  final String id;
  final String title;
  final double amount;
  final String transactionId;
  final DateTime date;
  // final String userId;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date, 
    // required this.userId,
    required this.transactionId
  });

  factory Transaction.fromJSON(Map<String, dynamic> json) {
    return Transaction(
      id: json['ID'],
      title: json['transaction_title'],
      amount: double.parse(json['transaction_amount']),
      transactionId: json['transaction_id'],
      date:DateTime.parse(json['date']),
      // userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'ID': id,
      'transaction_title': title,
      'transaction_amount': amount.toString(),
      'transaction_id': transactionId,
      'date':date.toIso8601String(),
      // 'user_id':userId
    };
  }
}