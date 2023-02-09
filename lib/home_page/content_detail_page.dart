// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_progect/server/data.dart';
import 'package:getx_progect/server/model.dart';
import 'package:getx_progect/home_page/my_detail_page.dart';

class ContentDetailPage extends StatefulWidget {
  final User user;

  ContentDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ContentDetailPageState createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF99D3ED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int e = 0; e < users.length; e++)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(() => MyDetailPage(userData: widget.user));
                  },
                  child: Container(
                    height: 220,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          height: 220,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: e.isEven
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
                                    widget.user.name,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      widget.user.txt,
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      for (int i = 0; i < users.length; i++)
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(widget.user.img),
                                                fit: BoxFit.cover,
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
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
