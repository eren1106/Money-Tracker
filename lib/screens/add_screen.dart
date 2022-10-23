import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracker/theme/app_theme.dart';
import 'package:money_tracker/utils/firestore_methods.dart';
import 'dart:io';
import 'package:money_tracker/utils/utils.dart';
import 'package:money_tracker/widgets/text_field_input.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _categories = [
    'Clothing',
    'Debt',
    'Education',
    'Entertainment',
    'Food',
    'Household',
    'Insurance',
    'Medical',
    'Personal',
    'Transportation',
    'Utilities',
    'Others'
  ];

  String _category = 'Food';
  DateTime _date = DateTime.now();
  File? _image;

  bool _isLoading = false;

  @override
  dispose() {
    super.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Add an Image'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  File image = await pickImage(ImageSource.camera);
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  File image = await pickImage(ImageSource.gallery);
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _addExpense() async {
    String title = _titleController.text;
    double price = double.parse(_priceController.text);
    String description = _descriptionController.text;

    setState(() {
      _isLoading = true;
    });

    try {
      String res = await FirestoreMethods().addExpense(
        FirebaseAuth.instance.currentUser!.uid,
        title,
        description,
        _category,
        _image,
        price,
        _date,
      );

      if (res == 'success') {
        showSnackBar('Expense added successfully', context);
      } else {
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(),
              verticalSeparator(),
              TextFieldInput(
                label: 'Title',
                textInputType: TextInputType.text,
                textEditingController: _titleController,
              ),
              verticalSeparator(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldInput(
                      label: 'Price',
                      textInputType: TextInputType.text,
                      textEditingController: _priceController,
                    ),
                  ),
                  horizontalSeparator(),
                  Flexible(
                    fit: FlexFit.tight,
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          //showDatePicker will return a future
                          context: context,
                          initialDate: _date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if pressed CANCEL
                        if (newDate == null) return;
                        //if pressed OK
                        setState(() {
                          _date = newDate;
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 12,
                        ),
                        child: Text(
                          '${_date.day}/${_date.month}/${_date.year}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: AppTheme.colors.grey,
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        side: BorderSide(width: 1, color: AppTheme.colors.grey),
                      ),
                    ),
                  ),
                  horizontalSeparator(),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: CategoriesDropDown(),
                  ),
                ],
              ),
              verticalSeparator(),
              TextFieldInput(
                label: 'Description',
                textInputType: TextInputType.multiline,
                textEditingController: _descriptionController,
                rows: 3,
              ),
              verticalSeparator(),
              ImageSection(context),
              verticalSeparator(),
              ElevatedButton(
                onPressed: _addExpense,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Add',
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ImageSection(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _selectImage(context);
        },
        child: _image == null
            ? Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppTheme.colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 160,
                      color: AppTheme.colors.grey,
                    ),
                    Text(
                      'Add an image',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : Image.file(
                _image!,
                fit: BoxFit.cover,
              ), // '!' means non-nullable type
      ),
    );
  }

  DropdownButton<String> CategoriesDropDown() {
    return DropdownButton(
      value: _category,
      items: _categories.map((category) => buildMenuItem(category)).toList(),
      onChanged: (value) {
        setState(() {
          _category = value as String;
        });
      },
      isExpanded: true,
    );
  }

  SizedBox horizontalSeparator() => SizedBox(width: 20);

  SizedBox verticalSeparator() {
    return SizedBox(
      height: 20,
    );
  }

  Text Title() {
    return Text(
      'Add Expense',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),
  );
}
