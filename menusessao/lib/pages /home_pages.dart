// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final pageContoller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _Menu((section) {
          pageContoller.animateToPage(section,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }),
        Expanded(
          child: PageView(
            controller: pageContoller,
            scrollDirection: Axis.vertical,
            pageSnapping: false,
            children: const [
              _Section(
                color: Colors.red,
              ),
              _Section(
                color: Colors.blue,
              ),
              _Section(
                color: Colors.green,
              )
            ],
          ),
        )
      ],
    ));
  }
}

typedef SectionCallback = void Function(int);

class _Menu extends StatelessWidget {
  final SectionCallback sectionClick;
  const _Menu(
    this.sectionClick,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                sectionClick(0);
              },
              child: const Text('Sessao')),
          TextButton(
              onPressed: () {
                sectionClick(1);
              },
              child: const Text('Sessao')),
          TextButton(
              onPressed: () {
                sectionClick(2);
              },
              child: const Text('Sessao'))
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final Color color;
  const _Section({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 1000,
    );
  }
}
