import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'All Screen',
          textSize: 20,
        ),
        centerTitle: true,
        backgroundColor: CO_DARKBLUE,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardButton(
              onPress: () {
                Navigator.pushNamed(context, RouteNames.product);
              },
              title: 'Products Screen',
              icon: Icons.production_quantity_limits,
            ),
            CardButton(
              onPress: () {
                Navigator.pushNamed(context, RouteNames.imgscr);
              },
              title: 'Images Screen',
              icon: Icons.image,
            ),
            CardButton(
              onPress: () {
                Navigator.pushNamed(context, RouteNames.todo);
              },
              title: 'TODO Screen',
              icon: Icons.toc_outlined,
            )
          ],
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
    required this.title,
    this.onPress,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Function()? onPress;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(
              icon,
              color: CO_RED,
              size: 40,
            ),
            title: CustomText(
              text: title,
              textSize: 20,
              color: CO_BLUE,
            ),
            trailing: const Icon(
              Icons.arrow_right_alt_outlined,
              color: CO_BLUE,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
