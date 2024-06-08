import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

import "package:http/http.dart" as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(dotenv.env['DATABASE_URL']!, 'shopping_list.json');

    final response = await http.get(url);
    final Map<String, dynamic> listData = jsonDecode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }

    setState(() {
      _groceryItems = loadedItems;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    _loadItems();
  }

  void _removeItem(String id) {
    setState(() {
      _groceryItems.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("데이터가 없습니다."),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          final item = _groceryItems[index];

          return Dismissible(
              onDismissed: (_) => _removeItem(item.id),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                child: const Icon(Icons.delete, color: Colors.white, size: 24),
              ),
              key: ValueKey(item.id),
              child: ListTile(
                title: Text(item.name),
                subtitle: Text('Quantity: ${item.quantity}'),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: item.category.color,
                ),
                trailing: Text(
                  item.category.title,
                  style: TextStyle(color: item.category.color),
                ),
              ));
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _addItem(),
            )
          ],
        ),
        body: content);
  }
}
