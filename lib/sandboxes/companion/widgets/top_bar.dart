// Import directives
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.title,
    // required this.searchBarTitle,
  }) : super(key: key);

  final String title;
  // final String searchBarTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             Text(
              title,
              style: TextStyle(
                height: 1.3,
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   color: Color.fromARGB(255, 230, 230, 230).withOpacity(0.8),
              // ),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      // decoration: const BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   color: Color(0xffE59252),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}