import 'package:flutter/material.dart';
import 'package:web_redirect/utils/utils.dart';


class OpenView extends StatefulWidget {
  const OpenView({Key? key}) : super(key: key);

  @override
  _OpenViewState createState() => _OpenViewState();
}

class _OpenViewState extends State<OpenView> {
  final Map<int, String> images = {
    1: 'assets/book_1.jpg',
    2: 'assets/book_2.jpg',
    3: 'assets/kufar.png',
    4: 'assets/onliner.png'
  };

  final Map<int, String> urls = {
    1: 'https://www.youtube.com/c/LearnDartFlutter',
    2: 'https://www.youtube.com/c/LearnDartFlutter',
    3: 'https://www.youtube.com/c/LearnDartFlutter',
    4: 'https://www.youtube.com/c/LearnDartFlutter'
  };

  int indexCount = 0;

  OpenType? openType;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Выберите картинку'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 200),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 600,
                ),
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      indexCount = index;

                      
                      return GestureDetector(
                        onTap: _onGoToComponentTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('${images[index + 1]}'),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      );

  void _onGoToComponentTap() {
    if (indexCount == 1) {
      redirectTo(
          'https://www.youtube.com/c/LearnDartFlutter',
          openType: OpenType.firstBook);
    } else if (indexCount == 2) {
      redirectTo('https://www.youtube.com/c/LearnDartFlutter',
          openType: OpenType.secondBook);
    } else if (indexCount == 3) {
      redirectTo('https://www.youtube.com/c/LearnDartFlutter', openType: OpenType.kufar);
    } else if (indexCount == 4) {
      redirectTo('https://www.youtube.com/c/LearnDartFlutter', openType: OpenType.onliner);
    }
  }
}
