import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/login/presentation/mobx/login_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  //Key for the Form widget.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String? _username, _email, _pass;

/*
  bool _showPassword = false;
  FilePickerResult? _profilePic;

  IconData get _passIcon =>
      _showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

  String get _passTooltip => _showPassword ? 'Hide' : 'Show';

  void _togglePassword() {
    setState(() => _showPassword = !_showPassword);
  }
*/

  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(builder: (context) {
            return Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            AppStrings.kAccountString,
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () => store.toggleScreenState(),
                            child: Text(
                              (store.isLoginState)
                                  ? AppStrings.kSignUp
                                  : AppStrings.kSignIn,
                              style: const TextStyle(
                                color: AppColors.kPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      const Text(
                        AppStrings.kWelcomeString,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppStrings.kAppDescription,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        children: [
                          if (!store.isLoginState)
                            GestureDetector(
                              onTap: () async {
                                store.profilePic =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png'],
                                );
                              },
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      height: 160,
                                      width: 160,
                                      child: store.profilePic == null
                                          ? Image.asset(
                                              AppAssets.kAvatar,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.memory(
                                              store.profilePic!.files.first
                                                  .bytes!,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.tealAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: AppColors.kPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                if (!store.isLoginState)
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (String? value) =>
                                        AppUtils.nameValidator(value),
                                    onSaved: (String? value) =>
                                        _username = value?.trim(),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    enableSuggestions: true,
                                    cursorColor: AppColors.kPrimary,
                                    cursorWidth: 1.5,
                                    style: AppUtils.kMyFormTextStyle,
                                    // Uses InputDecorationTheme defined in MaterialApp.
                                    decoration: const InputDecoration(
                                      label: Text('Name'),
                                      suffixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 32),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (String? value) =>
                                      AppUtils.emailValidator(value),
                                  onSaved: (String? value) =>
                                      _email = value?.trim(),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  enableSuggestions: true,
                                  cursorColor: AppColors.kPrimary,
                                  cursorWidth: 1.5,
                                  style: AppUtils.kMyFormTextStyle,
                                  decoration: const InputDecoration(
                                    label: Text('Email'),
                                    suffixIcon: Icon(
                                      Icons.alternate_email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (String? value) =>
                                      AppUtils.passValidator(value),
                                  onSaved: (String? value) =>
                                      _pass = value?.trim(),
                                  /*onFieldSubmitted: (String? value) =>
                                              submitForm(_formKey, context),*/
                                  textInputAction: TextInputAction.done,
                                  obscureText: !store.showPassword,
                                  cursorColor: AppColors.kPrimary,
                                  cursorWidth: 1.5,
                                  style: AppUtils.kMyFormTextStyle,
                                  decoration: InputDecoration(
                                    label: const Text('Password'),
                                    suffixIcon: IconButton(
                                      onPressed: () => store.togglePassword(),
                                      tooltip: store.passTooltip,
                                      color: Colors.grey,
                                      icon: Icon(store.passwordIcon),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                CupertinoButton(
                                  onPressed: () {},
                                  color: AppColors.kPrimary,
                                  borderRadius: BorderRadius.circular(4),
                                  child: Text(
                                    (store.isLoginState)
                                        ? AppStrings.kLoginString
                                        : AppStrings.kSignUpString,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.kWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          }),
          Expanded(
            child: SizedBox.expand(
              child: ColoredBox(
                color: AppColors.kPrimary,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.format_quote,
                          color: AppColors.kPrimary,
                          size: 48,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.27,
                      left: MediaQuery.of(context).size.width * 0.1 + 16,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Divider(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.33,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: const Text(
                        'Get \nUnstuck.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.55,
                      left: MediaQuery.of(context).size.width * 0.1 + 22,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Divider(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              'Computer Science is no more about computers than astronomy is about telescopes.',
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
