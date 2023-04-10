import 'package:flutter/material.dart';
import 'package:flutterprovider/models/language_model.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: Provider.of<LanguageModel>(context).locale.languageCode,
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'kh',
          child: Text('ភាសាខ្មែរ'),
        ),
      ],
      onChanged: (value) {
        final newLocale = Locale(value.toString(), '');
        Provider.of<LanguageModel>(context, listen: false).setLocale(newLocale);
      },
    );
  }
}
