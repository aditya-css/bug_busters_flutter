import 'dart:typed_data';

import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../core/constants/assets.dart';
import '../widgets/textfield.dart';

class MobileView extends StatefulWidget {
  final TextEditingController name;

  final TextEditingController email;

  final TextEditingController publicAddress;

  const MobileView(
      {Key? key,
      required this.name,
      required this.email,
      required this.publicAddress})
      : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  Uint8List? profilePic;

  Map currencyList = <String, Widget>{
    'Default': const Text("Select Currency"),
    'ETH': const Text("ETH"),
    'MTK': const Text("MTK")
  };

  var currency = [
    'Default',
    'ETH',
    'MTK',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Edit Profile",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            profilePic = await ImagePickerWeb.getImageAsBytes();
                            setState(() {});
                          },
                          child: ClipOval(
                            child: SizedBox(
                                height: 200,
                                child: profilePic == null
                                    ? Image.asset(
                                        AppAssets.kAvatar,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.memory(profilePic!)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () async {
                                profilePic =
                                    await ImagePickerWeb.getImageAsBytes();
                                setState(() {});
                              },
                              style: TextButton.styleFrom(
                                fixedSize: const Size(200, 50),
                                backgroundColor: AppColors.kPrimary,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.kWhite,
                              ),
                              label: const Text(
                                "Upload Picture",
                                style: TextStyle(
                                  color: AppColors.kWhite,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  profilePic = null;
                                });
                              },
                              style: TextButton.styleFrom(
                                fixedSize: const Size(200, 50),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: const BorderSide(
                                        color: AppColors.kRed)),
                              ),
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.kRed,
                              ),
                              label: const Text(
                                "Remove",
                                style: TextStyle(
                                  color: AppColors.kRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFieldProfile(
                                  controller: widget.name,
                                  title: "Name",
                                  width: 500,
                                  hintText: "Enter Full name"),
                              const SizedBox(height: 10),
                              TextFieldProfile(
                                  controller: widget.email,
                                  title: "Email",
                                  hintText: "Email",
                                  width: 500),
                              const SizedBox(height: 10),
                              TextFieldProfile(
                                controller: widget.publicAddress,
                                type: TextInputType.multiline,
                                maxLine: 1,
                                title: "Public Address",
                                hintText: "Public Address",
                                width: 500,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Submit"),
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.kPrimary),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
