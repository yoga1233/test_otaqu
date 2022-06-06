import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomSearch extends StatelessWidget {
  final String? Function(String?) onSubmit;
  final Function() onTap;
  final TextEditingController controller;
  const CustomSearch(
      {Key? key,
      required this.onSubmit,
      required this.controller,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: blackColor, offset: const Offset(0, 4), blurRadius: 4)
        ],
      ),
      child: TextField(
        onSubmitted: onSubmit,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Mau Pergi Kemana ?',
            hintStyle: blackTextStyle,
            suffixIcon: InkWell(onTap: onTap, child: const Icon(Icons.search)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
