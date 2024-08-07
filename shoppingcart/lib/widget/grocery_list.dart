import 'package:flutter/material.dart';

import 'package:shoppingcart/model/grocery_item.dart';
import 'package:shoppingcart/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loadItems();
  }

  /*
  void _loadItems() async{
  final url = Uri.https('link', 'shopping-cart.json');
  try{
   final response = await http.get(url);
  if(response.statusCode >= 400){
  setState((){
  _error = 'Failed to fetch data. Please try again later';
  });
  
  }

  if(response.body == 'null'){
  setState((){
  _isLoading = false;
  });
  return; 
  }
  final Map<String, dynamic> listData = json.decode(response.body);
  final List<GroceryItem> loadedItems = []
  for(final item in listData.entries){
  final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category']).value;
  _loadedItems.add(
  GroceryItem(
  id: item.key,
  name: item.value['name'],
  quantity: item.value['quantity'],
  category: category,
  ),
  );
  }
  setState((){
  _groceryItems = loadedItems;
  _isLoading = false;
  });

  } catch(error){
  _error = 'Something went wrong. Please try again later'
  }
 
  }
  */

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));

    /*
    if(newItem == null){
    return null;
    }
    setState((){
    _groceryItems.add(newItem);
    _isLoading = false;

    })
    */
  }

  void _removeItem(GroceryItem item) {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    /*
    final url = Uri.https('link', 'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    if(response.statusCode >= 400){
    //optional: Show error message
    setState((){
    _groceryItems.insert(index, item);
    });
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );
    /*
    if(_isLoading){
    content = const Center(child: CircularProgressIndicator());
    }
     */
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            trailing: Text(_groceryItems[index].quantity.toString()),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
          ),
        ),
      );
    }
    /*
    if (_error != null){
    content = Center(child: Text(_error!));
    }
    */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: content,
    );
  }
}
