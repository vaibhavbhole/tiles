import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiles/viewmodels/UserVM.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserVm>(builder: (context, uservm, child) {
      return uservm.user != null
          ? Card(
              color: Colors.yellow.shade700,
              elevation: 2.0,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      uservm.user?.imagePath ?? "",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      uservm.user?.name ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      uservm.user?.email ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Image.asset(
                      'assets/images/arham_technosoft.jpg',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                  const Text(
                    "YOUR POINTS BALANCE",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Text(
                    "${uservm.user?.totalPointsAvailable}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "POINTS EARNED",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                Text(
                                  "${uservm.user?.totalPointsEarned}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Text(
                                  "POINTS EXPIRED",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                Text(
                                  "${uservm.user?.totalPointsExpiring}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Text(
                                  "POINTS REDEEMED",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                Text(
                                  "${uservm.user?.totalPointsRedeemed}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Container();
    });
  }
}
