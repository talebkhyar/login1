import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final FocusNode _focusNodeConfirmbac = FocusNode();
  final FocusNode _focusNodeuser = FocusNode();

  final FocusNode _focusNodeConfirtelephone = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();
  final TextEditingController _controllernni = TextEditingController();
  final TextEditingController _controllerbac = TextEditingController();
  final TextEditingController _controllertelephone = TextEditingController();

  final Box _boxAccounts = Hive.box("accounts");
  bool _obscurePassword = true;
  File? _file;
  File? cart;
  File? releve;
  Future<File?> rec() async {
    final mycart = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (mycart != null) {
      setState(() {
        _file = File(mycart.path);
      });
      return _file;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "ISCAE",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 40, // Taille de la police
                    fontWeight: FontWeight.bold, // Gras
                    color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Text(
                "Creé Votre Compte",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _controllernni,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLength: 14,
                decoration: InputDecoration(
                  labelText: "NNI",
                  prefixIcon: const Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter NNI";
                  } else if (value.length < 14) {
                    return "NNI doit etre de 14 chiffre.";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "NNIi already registered.";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeConfirmbac.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerbac,
                keyboardType: TextInputType.number,
                focusNode: _focusNodeConfirmbac,
                decoration: InputDecoration(
                  labelText: "Numero Bac",
                  prefixIcon: const Icon(Icons.account_box),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter numero bac.";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "numero bac is already registered.";
                  }

                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirtelephone.requestFocus(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var status = await Permission.camera.status;
                      if (status.isDenied) {
                        cart = await rec();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      child: const Row(
                        children: [
                          Icon(Icons.photo),
                          SizedBox(width: 10),
                          Text("cart d'identité"),
                        ],
                      ),
                    ),
                  ),
                  cart != null
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ) // Image sélectionnée
                      : const Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 30,
                        ) // Aucune image sélectionnée
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      releve = await rec();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 57, vertical: 15),
                      child: const Row(
                        children: [
                          Icon(Icons.file_open_sharp),
                          SizedBox(width: 10),
                          Text("Relevé De Note"),
                        ],
                      ),
                    ),
                  ),
                  releve != null
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ) // Image sélectionnée
                      : const Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 30,
                        ) // Aucune image sélectionnée
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllertelephone,
                keyboardType: TextInputType.number,
                focusNode: _focusNodeConfirtelephone,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: "Telephone",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone.";
                  } else if (!RegExp(r'^[2-4]').hasMatch(value)) {
                    // Le texte ne commence pas par 2, 3 ou 4
                    return "Le texte doit commencer par 2, 3 ou 4.";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "phone is already registered.";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeuser.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                focusNode: _focusNodeuser,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter username.";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "Username is already registered.";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerEmail,
                focusNode: _focusNodeEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Invalid email";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerConFirmPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodeConfirmPassword,
                maxLength: 8,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value != _controllerPassword.text) {
                    return "Password doesn't match.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _boxAccounts.put(
                          _controllerUsername.text,
                          _controllerConFirmPassword.text,
                          //  _controllerbac.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("Registered Successfully"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Enregistré"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous avez déja un compte?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
