import "package:flutter/material.dart";

import "../data/categories.dart";
import "../models/category.dart";

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final FocusNode _focusNode = FocusNode();
  String entered_Name = "";
  var entered_Quantity = 0;
  bool _isFocused = false;
  var _selectedCategory = categories[Categories.vegetables]!;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

    _focusNode.addListener((){
      setState(() {
         _isFocused = _focusNode.hasFocus;
      });
    });
  }
  void _saveItem() {

       if(_formKey.currentState!.validate()){
         _formKey.currentState!.save();
       }

  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new Item")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                focusNode: _focusNode,
                style: TextStyle(fontSize: _isFocused ? 18 : 22, color: Colors.white),
                maxLength: 50,
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(label: Text("Name"),
                labelStyle: TextStyle(fontSize: 18, color: Colors.white)
                ),
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50){
                    return "Must be between 1 and 50 characters";
                  }
                  return null;
                },
                onSaved: (value){
                    entered_Name = value!;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(label: Text("Quantity")),
                      initialValue: "1",
                      validator: (value) {
                        if(value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! <= 0){
                          return "Must be between 1 and 50 characters";
                        }
                        return null;
                      },
                      onSaved: (value){
                        entered_Quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      initialValue: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            onTap: () {},
                            value: category.key,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (v) {
                          print(v);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                     _formKey.currentState!.reset();
                  }, child: const Text("Reset"),),
                  ElevatedButton(onPressed: _saveItem,
                    child: Text("Add Item")
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
