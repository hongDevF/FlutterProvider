// ignore_for_file: sort_child_properties_last, unused_field, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/utils/utils.dart';
import 'package:flutterprovider/view_models/auth_view_model.dart';
import 'package:flutterprovider/views/screens/chats/note_screen.dart';
import 'package:flutterprovider/views/screens/university_screen.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

// model bottom sheet

import '../../widgets/custom_text_button.dart';
import '../../widgets/home_widget/temperature_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  List<Color> colors = [
    CO_BLUE,
    CO_GRAY,
    CO_DEEPPINK,
    CO_RED,
  ];

  List<String> svg = [
    'lib/assets/icons/temperature.svg',
    'lib/assets/icons/temperature1.svg',
    'lib/assets/icons/temperature2.svg',
    'lib/assets/icons/temperature3.svg',
  ];
  @override
  void initState() {
    super.initState();
    // print(_selectedDate);
  }

  Future toLoginpage() async {
    // return await Future.delayed(
    //   const Duration(milliseconds: 1000),
    //   () => Navigator.pushReplacementNamed(context, RouteNames.login),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CO_BLUE,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: 'Home',
          textSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/card'),
            icon: Icon(
              Icons.card_membership_outlined,
            ),
          ),
          // Badge(
          //   position: BadgePosition.topEnd(top: 3, end: 3),
          //   animationDuration: const Duration(milliseconds: 300),
          //   animationType: BadgeAnimationType.scale,
          //   badgeContent: const Text(
          //     '2',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   child: IconButton(
          //       icon: const Icon(
          //         Icons.notification_important,
          //         size: 30,
          //       ),
          //       onPressed: () {}),
          // ),
          CustomTextButton(
            name: 'SignOut',
            color: CO_WHITE,
            onPress: () {
              AuthViewModel authViewModel =
                  Provider.of<AuthViewModel>(context, listen: false);
              authViewModel.signOut();
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: CO_WHITE),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: CO_WHITE,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(2, 2),
                      color: Colors.grey.shade300,
                    )
                  ],
                ),
                child: CircularPercentIndicator(
                  radius: 85,
                  lineWidth: 15,
                  percent: 0.8,
                  circularStrokeCap: CircularStrokeCap.round,
                  animationDuration: 2000,
                  animation: true,
                  animateFromLastPercent: true,

                  center: const Icon(
                    Icons.home,
                    color: Colors.amberAccent,
                    shadows: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.blue,
                        offset: Offset(5, 5),
                      )
                    ],
                    size: 120,
                  ),
                  // progressColor: Colors.green,/
                  linearGradient: const LinearGradient(colors: [
                    Colors.greenAccent,
                    CO_BLUE,
                    Colors.greenAccent,
                  ], begin: Alignment.bottomLeft, end: Alignment.topLeft),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      // onTap: () {
                      //   print(svg[index].toUpperCase());
                      //   showGeneralDialogBuilder(context, index);
                      // },
                      child: TemperatureButton(
                        svg: svg[index],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: CO_BLUE,
                ),
                margin: EdgeInsets.all(15),
                width: double.infinity,
                child: CustomTextButton(
                  color: CO_WHITE,
                  name: 'Home Screen1',
                  onPress: () => Navigator.pushNamed(context, RouteNames.home1),
                ),
              ),
              // University buttton
              _DefailButtonNav(
                onTap: () => Utils.GlobalRoute(
                  context: context,
                  screen: const UniversityScreen(),
                ),
                btnName: 'University',
              ),

              // To Chat button nava
              _DefailButtonNav(
                btnName: 'Chat',
                onTap: () => Utils.GlobalRoute(
                  context: context,
                  screen: const NoteListSCreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefailButtonNav extends StatelessWidget {
  const _DefailButtonNav({
    required this.btnName,
    required this.onTap,
  });
  final String btnName;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: CO_BLUE,
      ),
      margin: EdgeInsets.all(15),
      width: double.infinity,
      child: CustomTextButton(
        color: CO_WHITE,
        name: btnName,
        onPress: onTap,
      ),
    );
  }
}
