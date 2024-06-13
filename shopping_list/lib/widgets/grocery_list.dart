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
  final List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _itemsFuture;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(dotenv.env['DATABASE_URL']!, 'shopping_list.json');

    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to load data: ${response.body}');

      // setState(() {
      //   _errorMessage = 'Failed to load data: ${response.body}';
      // });
    }

    if (response.body == 'null') {
      return [];
    }

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

    return loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(String id) async {
    setState(() {
      _groceryItems.removeWhere((item) => item.id == id);
    });

    final url =
        Uri.https(dotenv.env['DATABASE_URL']!, 'shopping_list/$id.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _errorMessage = 'Failed to delete item: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("데이터가 없습니다."),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];

              return Dismissible(
                onDismissed: (_) => _removeItem(item.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child:
                      const Icon(Icons.delete, color: Colors.white, size: 24),
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
