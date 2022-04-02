import 'package:bug_busters_flutter/features/profile/presentation/pages/desktopview.dart';
import 'package:bug_busters_flutter/features/profile/presentation/pages/mobileview.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _publicAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 760) {
        return DesktopView(
          name: _name,
          email: _email,
          publicAddress: _publicAddress,
        );
      } else {
        return MobileView(
          name: _name,
          email: _email,
          publicAddress: _publicAddress,
        );
      }
    });
  }
}
