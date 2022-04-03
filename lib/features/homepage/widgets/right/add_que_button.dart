import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddQuesButton extends StatelessWidget {
  AddQuesButton({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
            content: SizedBox(
              width: 40.w,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add Your Question",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Share your thoughts",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            // backgroundColor: AppColors.kCardBG,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppColors.kCardBG,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.kCardBG,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: AppColors.kWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showAlert(context);
      },
      style: TextButton.styleFrom(
        backgroundColor: AppColors.kPrimary,
        elevation: 0,
        minimumSize: const Size(280, 50),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: const FittedBox(
        child: Icon(
          Icons.add,
          size: 16,
          color: AppColors.kWhite,
        ),
      ),
      label: const FittedBox(
        child: Text(
          "Add Question",
          style: TextStyle(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
