import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  final Function(
      {
      // required String title,
      // required DateTime date,
      // required double amount,
      // required Category category,
      required ExpenseModel expenseModel}) addData;
  const NewExpense({
    super.key,
    required this.addData,
  });

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory = Category.leisure;
  void _pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidAmount = enteredAmount == null || enteredAmount < 0;
    if (_titleController.text.trim().isEmpty ||
        invalidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure to enter a valid Title,Amount and Date'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Ok'))
          ],
        ),
      );
      return;
    }
    widget.addData(
      // title: _titleController.text,
      // amount: double.parse(_amountController.text),
      // category: _selectedCategory,
      // date: _selectedDate ?? DateTime.now(),
      expenseModel: ExpenseModel(
        title: _titleController.text,
        date: _selectedDate ?? DateTime.now(),
        amount: enteredAmount,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            8,
            8,
            8,
            MediaQuery.of(context).viewInsets.bottom + 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (maxWidth >= 600)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          label: Text('Title'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '\$ ',
                        ),
                      ),
                    ),
                  ],
                )
              else
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
              if (maxWidth >= 600)
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate != null
                              ? formatter.format(_selectedDate!)
                              : ' No Selected Date'),
                          IconButton(
                            onPressed: _pickDate,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ),
                    )
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '\$ ',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate != null
                              ? formatter.format(_selectedDate!)
                              : ' No Selected Date'),
                          IconButton(
                            onPressed: _pickDate,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              const SizedBox(
                height: 8,
              ),
              if (maxWidth >= 600)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _submitExpenseData,
                      child: const Text('Save Expense'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                )
              else
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _submitExpenseData,
                      child: const Text('Save Expense'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                )
            ],
          ),
        ),
      );
    });
  }
}
