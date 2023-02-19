// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutterprovider/models/image_model.dart';
import 'package:flutterprovider/view_models/image_view_model.dart';
import 'package:flutterprovider/views/screens/home/images/full_image_screen.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
// import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_dialog.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ImageViewModel>(context, listen: false).getAllImages();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CO_DARKBLUE,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Image View',
          color: CO_WHITE,
          textSize: 25,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const buildBody(),
    );
  }
}

class buildBody extends StatelessWidget {
  const buildBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageViewModel>(
      builder: (context, value, __) {
        final image = value.image;
        if (image.isEmpty) {
          return Center(
            child: Lottie.asset(
              'lib/assets/images/lotties/loading_rounded.json',
            ),
          );
        } else {
          return buildGridImages(image: image);
        }
      },
    );
  }
}

class buildGridImages extends StatelessWidget {
  const buildGridImages({
    Key? key,
    required this.image,
  }) : super(key: key);

  final List<ImageModel> image;

  @override
  Widget build(BuildContext context) {
    final ImageViewModel imageViewModel = Provider.of<ImageViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
        itemCount: image.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 6 / 8,
        ),
        itemBuilder: (context, index) {
          final item = image[index];
          return InkWell(
            onLongPress: () => CustomAlertDialog(
              context,
              title: 'Do you want to delete this image? ',
              onPressOK: () {
                Provider.of<ImageViewModel>(context, listen: false);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FullImageScreen(),
                  //! Pass the arguments as part of the RouteSettings. The
                  //! DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: item,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: CO_BLACK,
                image: DecorationImage(
                  image: NetworkImage(item.url!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
