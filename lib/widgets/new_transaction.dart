import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
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
            controller: titleController,
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
            controller: amountController,
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
            children: [
              const Text("No Date chosen yet!"),
              TextButton(
                  onPressed: () => _presentDatePicker(),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(color: Colors.green[800]),
                  ))
            ],
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
                onPressed: () => _submitData,
                child: const Text("Add Transaction"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
