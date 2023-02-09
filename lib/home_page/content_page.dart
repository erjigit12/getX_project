// ignore_for_file: library_private_types_in_public_api, unused_import, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously
import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_progect/home_page/content_detail_page.dart';
import 'package:getx_progect/server/data.dart';
import 'package:getx_progect/home_page/my_detail_page.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // int _currentIndex = 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xffc5e5f3),
        child: Column(
          children: [
            Container(
              width: width,
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
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/img/back.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'James Smith',
                          style: TextStyle(
                            color: Color(0xff3b3f42),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
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
                        padding: EdgeInsets.only(left: 80),
                        child: Expanded(
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Color(0xff69c5df),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 23),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Contest',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFffbc33e),
                    ),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: users.length,
                itemBuilder: (_, i) {
                  final user = users[i];
                  return InkWell(
                    onTap: () {
                      Get.to(() => MyDetailPage(userData: user));
                    },
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          height: 220,
                          // width: MediaQuery.of(context).size.width - 20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: i.isEven
                                ? const Color(0xff69c5df)
                                : const Color(0xff9294cc),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Text(
                                    user.title,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                                // Expanded(child: Container()),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      user.txt,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Padding(
                                  padding: EdgeInsets.only(top: 18),
                                  child: Divider(thickness: 2.0),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                  image: AssetImage(user.img),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 23),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Resent Contest',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFffbc33e),
                    ),
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.88),
                      itemCount: users.length,
                      itemBuilder: (_, i) {
                        final user = users[i];
                        return InkWell(
                          onTap: () {
                            final data = users[i];
                            Get.to(() => ContentDetailPage(user: data));
                          },
                          child: const Icon(Icons.arrow_forward_ios),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              // decoration: BoxDecoration(
              //   color: Colors.green[50],
              // ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  final user = users[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
                      height: 85,
                      decoration: BoxDecoration(
                        color: const Color(0xffedf8fd),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(user.images),
                        ),
                        title: Text(
                          user.status,
                          style: const TextStyle(
                            color: Color(0xFffbc33e),
                          ),
                        ),
                        subtitle: Text('${user.text} ${user.day} '),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
