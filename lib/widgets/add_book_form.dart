import 'package:flutter/material.dart';

class AddBookForm extends StatelessWidget {
  const AddBookForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add book',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
            items: <String>['Fiction', 'Non-Fiction', 'Science']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          SizedBox(height: 15),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Book Name',
              border: OutlineInputBorder(),
            ),
            items: <String>['Book 1', 'Book 2', 'Book 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Details',
              border: OutlineInputBorder(),
            ),
            maxLines: 1,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Type your review',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add book logic
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(child: Text('Add')),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
