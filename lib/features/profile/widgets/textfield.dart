import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfile extends StatefulWidget {
  final double width;
  final String hintText;
  final String title;
  final TextInputType type;
  final int maxLine;
  final TextEditingController controller;

  const TextFieldProfile({
    Key? key,
    this.width = double.infinity,
    this.hintText = "",
    this.title = '',
    this.type = TextInputType.text,
    this.maxLine = 1,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldProfile> createState() => _TextFieldProfileState();
}

class _TextFieldProfileState extends State<TextFieldProfile> {
  @override
  Widget build(BuildContext context) {
    return //Custom Text Field
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        Container(
          width: widget.width,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 4,
          ),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.type,
            maxLines: widget.maxLine,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const OutlineInputBorder(),
              hintStyle: const TextStyle(color: AppColors.kBlack),
            ),
          ),
        ),
      ],
    );
  }
}
