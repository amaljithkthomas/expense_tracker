import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, work, leisure, travel }

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();
}
