import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/transaction_controller.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {

  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _transactionController = Get.find<TransactionController>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  void _submitData() async{
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    
    final newTransaction = Transaction(
      id:"",
      title: enteredTitle,
      amount: enteredAmount,
      transactionId: "",
      date: _selectedDate,
    );

    try {
      Get.back();
      await _transactionController.addTransaction(newTransaction);
    } catch (e) {
      Get.snackbar("error", "Failed to add transaction");
    }

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
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.only(left: 10.0, top: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              onSubmitted: (_) {
                _submitData();
              },
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
      ),
    );
  }
}
