import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/profile/presentation/pages/edit_profile.dart';
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
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: AppColors.kBlack),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(AppStrings.kAppName),
              const Flexible(child: SizedBox(width: 200)),
              Row(children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: AppColors.kGrey,
                  ),
                ),
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
                )
              ]),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  EditProfile(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
