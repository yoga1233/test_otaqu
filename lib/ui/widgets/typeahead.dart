import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:test_otaqu/services/search_service.dart';

import '../../shared/theme.dart';

class TypeaHead extends StatefulWidget {
  final TextEditingController controllerText;
  final Function() onTap;
  final Function(String) onSugesSelect;
  const TypeaHead(
      {Key? key,
      required this.onTap,
      required this.controllerText,
      required this.onSugesSelect})
      : super(key: key);

  @override
  State<TypeaHead> createState() => _TypeaHeadState();
}

String? selectedCity;
// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _TypeaHeadState extends State<TypeaHead> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: greyColor, offset: const Offset(0, 4), blurRadius: 4)
        ],
      ),
      child: Column(
        children: [
          TypeAheadFormField(
            suggestionsCallback: (pattern) {
              return SearchService.getSuggestions(pattern);
            },
            textFieldConfiguration: TextFieldConfiguration(
              controller: widget.controllerText,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Mau Pergi Kemana ?',
                  hintStyle: blackTextStyle,
                  suffixIcon: InkWell(
                      onTap: widget.onTap, child: const Icon(Icons.search)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10))),
            ),
            itemBuilder: (context, String suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: widget.onSugesSelect,
            validator: (value) =>
                value!.isEmpty ? 'Please select a city' : null,
            onSaved: (value) => selectedCity = value,
          ),
        ],
      ),
    );
  }
}
