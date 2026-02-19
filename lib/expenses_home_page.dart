import 'package:flutter/material.dart';
import 'add_expense_page.dart';

class ExpensesHomePage extends StatelessWidget {
  const ExpensesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '+ Add',
            onPressed: () => _navigateToAddExpense(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToAddExpense(context),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }

  Future<void> _navigateToAddExpense(BuildContext context) async {
    // Navigate and wait for result
    final title = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddExpensePage()),
    );

    // Check if context is still mounted before showing SnackBar
    if (!context.mounted) return;

    // If a title was returned, show a SnackBar
    if (title != null && title is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added: $title'),
          backgroundColor: Colors.teal,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}