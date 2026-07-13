import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/common/widgets/back_button.dart';
import 'package:doctor_appointment/features/auth/repos/client_profile.dart';
import 'package:doctor_appointment/features/auth/utils/email_validator.dart';
import 'package:doctor_appointment/features/auth/widgets/text_form_field.dart';
import 'package:doctor_appointment/utils/gapped_widget_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  final ActiveSession session;
  final ClientProfileRepo remoteRepo;

  const EditProfilePage({
    required this.session,
    required this.remoteRepo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: .fromHeight(30),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            SizedBox(width: 24),
            MyBackButton(),
            SizedBox(width: 14),
            Text(
              "Fill Your Profile",
              style: TextTheme.of(context).headlineLarge,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: .center,
        children: [
          _ProfilePicture(session: session),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 24),
              child: _ProfileDetailsForm(
                session: session,
                remoteRepo: remoteRepo,
                client: session.client,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({required this.session});

  final ActiveSession session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(16),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 84,
            backgroundImage: AssetImage("assets/images/no-profile-picture.png"),
            foregroundImage: session.client.picture == null
                ? null
                : MemoryImage(session.client.picture!),
          ),
          Positioned(
            bottom: 10,
            right: 7,
            child: SvgPicture.asset("assets/images/edit-icon.svg"),
          ),
        ],
      ),
    );
  }
}

class _ProfileDetailsForm extends StatefulWidget {
  final ClientInfo client;
  final ClientProfileRepo remoteRepo;
  final ActiveSession session;

  const _ProfileDetailsForm({
    required this.session,
    required this.remoteRepo,
    required this.client,
  });

  @override
  State<StatefulWidget> createState() => _ProfileDetailsFormState();
}

class _ProfileDetailsFormState extends State<_ProfileDetailsForm> {
  late final TextEditingController nameController;
  late final TextEditingController nicknameController;
  late final TextEditingController emailController;
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool nameChanged = false;
  bool nicknameChanged = false;
  bool emailChanged = false;
  bool birthdayChanged = false;
  bool passwordChanged = false;
  bool genderChanged = false;

  Gender? gender;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.client.name);
    nicknameController = TextEditingController(text: widget.client.nickname);
    emailController = TextEditingController(text: widget.client.email);
    gender = widget.session.client.gender;
    super.initState();
  }

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      await widget.remoteRepo.submit(
        name: nameChanged ? nameController.text : null,
        nickname: nicknameChanged ? nicknameController.text : null,
        submitNickname: nicknameChanged,
        gender: gender,
        email: emailChanged ? emailController.text : null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: gappedWidgetStack(
        gap: 16,
        orientation: Axis.vertical,
        crossAxisAlignment: .stretch,
        children: [
          AuthTextFormField(
            controller: nameController,
            label: "Full Name",
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter your full name"
                : null,
            onChanged: (_) {
              nameChanged = true;
            },
          ),
          AuthTextFormField(
            controller: nicknameController,
            label: "Nickname",
            validator: (input) => null,
            onChanged: (_) {
              nicknameChanged = true;
            },
          ),
          AuthTextFormField(
            controller: emailController,
            label: "Email",
            validator: EmailValidator.validate,
            onChanged: (_) {
              emailChanged = true;
            },
          ),
          AuthTextFormField(
            controller: birthdayController,
            label: "Date of Birth",
            icon: "assets/images/calendar-small.svg",
            validator: (datestr) =>
                (datestr == null || DateTime.tryParse(datestr) == null)
                ? "Invalid date"
                : null,
            onChanged: (_) {
              emailChanged = true;
            },
          ),
          _GenderDropdown(
            onChanged: (g) {
              gender = g;
              genderChanged = true;
            },
          ),
          AuthTextFormField(
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter a password"
                : null,
            controller: passwordController,
            icon: "assets/images/lock.svg",
            label: "Password",
            mustObscure: true,
          ),
          AuthTextFormField(
            validator: (input) => (input == null || input.isEmpty)
                ? "Please enter a password"
                : (input == passwordController.text)
                ? null
                : "Passwords do not match",
            controller: confirmPwdController,
            icon: "assets/images/lock.svg",
            label: "Confirm Password",
            mustObscure: true,
          ),
          SizedBox(
            height: 48,
            child: FilledButton(onPressed: submit, child: const Text("Save")),
          ),
        ],
      ),
    );
  }
}

class _GenderDropdown extends StatelessWidget {
  final void Function(Gender?) onChanged;

  const _GenderDropdown({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Gender?>(
      icon: SvgPicture.asset("assets/images/arrow-down.svg"),
      isExpanded: true,
      iconSize: 14,
      onChanged: (Gender? value) {
        onChanged(value);
      },
      items: List.of(
        <Gender?>[null]
            .followedBy(Gender.values)
            .map(
              (g) => DropdownMenuItem(
                value: g,
                child: Text(g?.name.capitalizeFirst ?? ""),
              ),
            ),
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: .all(.circular(8)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        labelStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
