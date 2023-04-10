// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/utils/utils.dart';
import 'package:flutterprovider/view_models/auth_view_model.dart';
import 'package:flutterprovider/views/widgets/custom_text_field.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:provider/provider.dart';

import '../../../view_models/theme_changer_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  File? _image;
  void _imagePicker(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  double _value = 0;
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = AuthViewModel();
    final themeChangeProvider = Provider.of<ThemeChangerProvider>(context);
    TextEditingController progress = TextEditingController();
    progress.text = _value.toInt().toString();

    final ThemeMode themeMode;
    int calc_ranks(ranks) {
      return (ranks).toInt();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CO_BLUE,
      ),
      drawer: const Drawer(
          // backgroundColor: LIGHTYELLOW,
          ),
      body: ListView(
        children: [
          // slide
          Row(
            children: [
              CustomText(text: "${_value.toInt()}%"),
              Expanded(
                child: Slider(
                    activeColor: Color.fromARGB(255, 32, 7, 255),
                    inactiveColor: Colors.grey,
                    max: 100,
                    // min: value,
                    value: _value,
                    onChanged: (data) {
                      setState(() {
                        _value = data;
                      });
                    }),
              ),
              CustomText(text: '100%'),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            content: Wrap(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 100,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      controller: progress,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(fontSize: 16),
                                        label: Text('Progress <= 100'),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        MaxValueTextInputFormatter(100),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: CustomText(
                                          text: 'Cancel',
                                          color: Colors.grey,
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            var data =
                                                double.tryParse(progress.text);
                                            log(data.toString());
                                            _value = data!;
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: CustomText(
                                          text: 'OK',
                                          color: Colors.blue,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: CustomText(text: 'Input')),
            ],
          ),
          // image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _image == null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amberAccent,
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_image!),
                    ),
              IconButton(
                  onPressed: () {
                    _imagePicker(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image, size: 30)),
            ],
          ),
          RadioListTile<ThemeMode>(
            title: Text("Ligh Mode"),
            value: ThemeMode.light,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("System mode"),
            value: ThemeMode.system,
            groupValue: themeChangeProvider.themeMode,
            onChanged: themeChangeProvider.setTheme,
          ),
          ElevatedButton(
            onPressed: () {
              Utils.toastMessage(
                msg: 'Testing',
                bg: Colors.green.shade400,
              );
              Navigator.pushNamed(context, RouteNames.user);
            },
            child: Text("TO USER PAGE"),
          ),
          ElevatedButton(
            onPressed: () {
              // Utils.toastMessage(
              //   msg: 'Testing',
              //   bg: Colors.green.shade400,
              // );
              Navigator.pushNamed(context, RouteNames.addProduct);
            },
            child: Text("Add Product"),
          ),
          customButton(
              onPress: () => Navigator.pushNamed(context, RouteNames.todo),
              btnName: 'TODO VIEW'),
          // customButton(onPress: authViewModel.signOut, btnName: 'SignOut'),
          customButton(
              onPress: () => Navigator.pushNamed(context, RouteNames.login),
              btnName: 'Log in'),
        ],
      ),
    );
  }
}

// format max value in flutter
class MaxValueTextInputFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueTextInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int value = int.tryParse(newValue.text) ?? 0;
    if (value > maxValue) {
      value = maxValue;
    }
    return TextEditingValue(
      text: value.toString(),
      selection: TextSelection.collapsed(offset: value.toString().length),
    );
  }
}
