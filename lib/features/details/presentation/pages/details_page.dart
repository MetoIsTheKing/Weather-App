import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/features/drawer/presentation/drawer_page/my_drawer.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  String title = 'Details Page';
  String whetherStatus = 'Partly Cloudy';

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
    return Scaffold(
        backgroundColor: AppColors.appGrey,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                advancedDrawerController.showDrawer();
              }),
          backgroundColor: AppColors.appBlue,
          foregroundColor: AppColors.appWhite,
          titleTextStyle: const TextStyle(color: AppColors.appWhite),
          title: const Text('Details Page'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.appBlue,
                            AppColors.appLightBlue,
                          ])),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: [
                      Image.asset('assets/images/cloud.png'),
                      Text(
                        whetherStatus,
                        style: const TextStyle(
                          color: AppColors.appWhite,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          color: AppColors.appWhite,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Opacity(
                    opacity: .9,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  child: const Text(
                                    "Yesterday",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          AppColors.appBlue)),
                                  child: const Text(
                                    "Today",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.appWhite),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  child: const Text(
                                    "Tomorrow",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/cloud.png',
                                    width: 50,
                                  ),
                                  const Text(
                                    '28°C',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.appDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/cloud.png',
                                    width: 50,
                                  ),
                                  const Text(
                                    '28°C',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.appDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/cloud.png',
                                    width: 50,
                                  ),
                                  const Text(
                                    '28°C',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.appDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/cloud.png',
                                    width: 50,
                                  ),
                                  const Text(
                                    '28°C',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.appDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/cloud.png',
                                    width: 50,
                                  ),
                                  const Text(
                                    '28°C',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.appDarkBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 100),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 8, // Spread of the shadow
                              offset:
                                  const Offset(0, 4), // Offset of the shadow
                            ),
                          ],
                          color: AppColors.appWhite),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 8, // Spread of the shadow
                              offset:
                                  const Offset(0, 4), // Offset of the shadow
                            ),
                          ],
                          color: AppColors.appWhite),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 8, // Spread of the shadow
                              offset:
                                  const Offset(0, 4), // Offset of the shadow
                            ),
                          ],
                          color: AppColors.appWhite),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 8, // Spread of the shadow
                              offset:
                                  const Offset(0, 4), // Offset of the shadow
                            ),
                          ],
                          color: AppColors.appWhite),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                    color: AppColors.appWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "✨ ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Its ok to hangout with your friend!",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
