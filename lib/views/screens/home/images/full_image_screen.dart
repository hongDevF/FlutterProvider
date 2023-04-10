// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutterprovider/models/image_model.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class FullImageScreen extends StatefulWidget {
  const FullImageScreen({super.key});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as ImageModel;
    final Uri uri = Uri.parse(image.url!);
    Future<void> _launchUrl() async {
      if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
      }
    }

    return Scaffold(
      backgroundColor: CO_WHITE,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Full Image',
          textSize: 25,
        ),
        backgroundColor: CO_BLACK,

        elevation: 0,
        // leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: PhotoView(imageProvider: NetworkImage(image.url!))),
          TextButton(
            onPressed: _launchUrl,
            child: CustomText(
              text: 'Link Image: ${image.url!}',
              color: CO_BLACK,
            ),
          )
        ],
      ),
    );
  }
}
