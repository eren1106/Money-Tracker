import 'package:flutter/material.dart';
import 'package:money_tracker/theme/app_theme.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<String> categories = ['Food', 'Cloth', 'Bill'];
  String category = 'Food';
  DateTime date = DateTime.now();
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
              VerticalSeparator(),
              TitleTextField(),
              VerticalSeparator(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: PriceTextField(),
                  ),
                  HorizontalSeparator(),
                  Flexible(
                    fit: FlexFit.tight,
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          //showDatePicker will return a future
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if pressed CANCEL
                        if (newDate == null) return;
                        //if pressed OK
                        setState(() {
                          date = newDate;
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 12,
                        ),
                        child: Text(
                          '${date.day}/${date.month}/${date.year}',
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
                  HorizontalSeparator(),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: CategoriesDropDown(),
                  ),
                ],
              ),
              VerticalSeparator(),
              DescriptionTextField(),
              VerticalSeparator(),
              Expanded(
                child: Container(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField DescriptionTextField() {
    return TextField(
      minLines: 3,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  DropdownButton<String> CategoriesDropDown() {
    return DropdownButton(
      value: category,
      items: categories.map((category) => buildMenuItem(category)).toList(),
      onChanged: (value) {
        setState(() {
          category = value as String;
        });
      },
    );
  }

  SizedBox HorizontalSeparator() => SizedBox(width: 20);

  TextField PriceTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Price',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  TextField TitleTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
      ),
    );
  }

  SizedBox VerticalSeparator() {
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
