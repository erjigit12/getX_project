// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_progect/home_page/content_page.dart';
import 'package:getx_progect/server/model.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({Key? key, required this.userData}) : super(key: key);
  final User userData;

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 300,
            color: const Color(0xffc5e5f3),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: Positioned(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const ContentPage());
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffedf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('${widget.userData.img}'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.userData.name}',
                                  style: const TextStyle(
                                    color: Color(0xff3b3f42),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Top Level',
                                  style: TextStyle(
                                    color: Color(0xfffdebb2),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 90),
                                child: Icon(
                                  Icons.notifications,
                                  size: 25,
                                  color: Color(0xff69c5df),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Positioned(
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F1F0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${widget.userData.title}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            '${widget.userData.txt}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        const Divider(
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Color(0xFF45C0F5),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                children: [
                                  Text(
                                    '${widget.userData.name}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Deadline',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 30),
                              const Icon(
                                Icons.monetization_on,
                                color: Color(0xFFFF3B4B),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${widget.userData.prize}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Prize',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              const Icon(
                                Icons.star,
                                color: Color(0xFffbc33e),
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Top Level',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Entry',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              SizedBox(width: 25),
              Text(
                'Total Porticipate',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(width: 15),
              Text(
                '(10)',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFffbc33e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const SizedBox(width: 22),
              for (int i = 0; i < 4; i++)
                Container(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage('${widget.userData.img}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(width: 22),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xFffbc33e),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Add to favorite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFffbc33e),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
