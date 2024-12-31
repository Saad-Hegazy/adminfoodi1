
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
class CustomDropDownSearch extends StatefulWidget {
  final String?  title;
  final List<SelectedListItem>  listdata;
  final TextEditingController  dropdownSelecteName;
  final TextEditingController  dropdownSelecteID;
  const CustomDropDownSearch({super.key, this.title, required this.listdata, required this.dropdownSelecteName, required this.dropdownSelecteID});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropdownSearch(){
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        maxSelectedItems: 3,
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelecteName.text =  selectedListItem.name;
          widget.dropdownSelecteID.text =  selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }


  @override
  Widget build(BuildContext context) {
    return        TextFormField(
      controller: widget.dropdownSelecteName,
      cursorColor: Colors.black,
      onTap:(){
        FocusScope.of(context).unfocus();
        showDropdownSearch();
      },
      decoration:InputDecoration(
          hintText: widget.dropdownSelecteName.text == "" ? widget.title : widget.dropdownSelecteName.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(widget.dropdownSelecteName.text == ""
                  ? widget.title!
                  : widget.dropdownSelecteName.text),
          ),
          suffixIcon: InkWell(child: Icon(Icons.arrow_drop_down), onTap: (){}),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.black12,
      //   contentPadding:
      //   const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
      //   hintText:
      //   border: const OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      // ),
    );
  }
}
