import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        centerTitle: false,
        titleTextStyle: const TextStyle(color: AppColors.kBlack, fontSize: 30),
        title: const Text(AppStrings.kMyProfile),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: AppColors.kGrey,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.kGrey,
                    )),
              ],
            )),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: Row(children: [
                    Column(
                      children: [
                        if (constraints.maxWidth > 700)
                          Flexible(
                              child: AnimatedContainer(
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: AppColors.kGrey, width: 3))),
                            width: 200,
                            height: MediaQuery.of(context).size.height,
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 70,
                                    color: AppColors.kWhite,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.edit),
                                        SizedBox(width: 10),
                                        Expanded(
                                            flex: 2,
                                            child: Text("Edit Profile")),
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 70,
                                    color: AppColors.kWhite,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.edit),
                                        SizedBox(width: 10),
                                        Expanded(
                                            flex: 2,
                                            child: Text("Edit Profile")),
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 70,
                                    color: AppColors.kWhite,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.edit),
                                        SizedBox(width: 10),
                                        Expanded(
                                            flex: 2,
                                            child: Text("Edit Profile")),
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ))
                        else
                          const SizedBox()
                      ],
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: const [
                            Text("Profile"),
                          ],
                        )),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
