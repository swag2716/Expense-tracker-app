import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: Colors.black,
      // elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            cursorColor: Colors.green,
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: "Title",
              labelStyle: TextStyle(color: Colors.green),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.green,
                ),
              ),
            ),
            onSubmitted: (_) => _submitData,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Colors.green,
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Amout",
              labelStyle: TextStyle(color: Colors.green),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.green,
                ),
              ),
            ),
            onSubmitted: (_) => _submitData,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedDate == null
                  ? "No Date chosen yet! "
                  : DateFormat.yMMMd().format(_selectedDate!)),
              TextButton(
                  onPressed: () => _presentDatePicker(),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(color: Colors.green[800]),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Colors.green[900]!,
                  Colors.green[800]!,
                  Colors.green[700]!,
                  Colors.green[600]!,
                  Colors.green[500]!,
                ])),
            child: SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () => _submitData(),
                child: const Text("Add Transaction"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
