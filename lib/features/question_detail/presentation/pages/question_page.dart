import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/widgets/responsive_question.dart';
import 'desktop_view.dart';
import 'mobile_view.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            content: Stack(
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Question',
                        style: TextStyle(
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 500,
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
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        toolbarHeight: 70,
        elevation: 14,
        shadowColor: AppColors.kGrey.withOpacity(0.2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///Logo
            SizedBox(
              child: Text(
                AppStrings.kAppName,
                style: Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.kBlack),
              ),
            ),
            const SizedBox(width: 40.0),

            ///SearchBar
            if (size.width > 960)
              Flexible(
                child: Container(
                  width: 500,
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey.shade300),
                      border: InputBorder.none,
                      hintText: "Search for Topics",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ),
              ),

            const SizedBox(width: 40.0),

            ///profile
            const CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ResponsiveQuestion(
          mobileView: MobileView(
            addAnswer: showAlert,
          ),
          desktopView: DesktopView(
            addAnswer: showAlert,
          ),
        ),
      ),
    );
  }
}
