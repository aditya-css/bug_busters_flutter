import 'package:bug_busters_flutter/features/profile/mobx/profile_store.dart';
import 'package:bug_busters_flutter/features/profile/pages/desktopview.dart';
import 'package:bug_busters_flutter/features/profile/pages/mobileview.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _publicAddress = TextEditingController();

  late ReactionDisposer disposer;
  late ProfileStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<ProfileStore>(context);
    disposer = reaction((_) => store.access, (List<String> access) {
      _publicAddress.text = access.first;
    });
  }

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

  @override
  void dispose() {
    super.dispose();
    disposer();
  }
}
