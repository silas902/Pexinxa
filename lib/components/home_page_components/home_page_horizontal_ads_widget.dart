import 'package:flutter/material.dart';

class HomePageHorizontalAdsWidget extends StatefulWidget {
  const HomePageHorizontalAdsWidget({Key? key}) : super(key: key);

  @override
  State<HomePageHorizontalAdsWidget> createState() =>
      _HomePageHorizontalAdsWidgetState();
}

class _HomePageHorizontalAdsWidgetState
    extends State<HomePageHorizontalAdsWidget> {
  late PageController _pageController;
  int activePage = 1;

  List<String> images = [
    'assets/images/Apple-iphone-smartphone-technology-1_(24218252052).jpg',
    'assets/images/pexels-jess-bailey-designs-788946.jpg',
    'assets/images/pexels-torsten-dettlaff-674884.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose (){
    super.dispose();
    _pageController.dispose();
  }


  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
          
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 220,
        width: deviceInfo.size.width,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: deviceInfo.size.width,
              child: PageView.builder(
    
                padEnds: false,
                itemCount: images.length,
                pageSnapping: false,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: ((context, index) {
                  if(images.last == images[index]){
                    return Padding(
                    padding: const EdgeInsets.only(right: 15 , left: 15),
                    
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  );
                  } else {
                    return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  );
                  }
                  
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length, activePage),
            )
          ],
        ),
      ),
    );
  }
}
