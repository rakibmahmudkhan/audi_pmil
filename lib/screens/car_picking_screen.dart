import 'package:audi_pmil/resource/widgets/action_button.dart';
import 'package:flutter/material.dart';

import '../utils/routes/route_name.dart';

class CarPickingScreen extends StatefulWidget {
  const CarPickingScreen({Key? key}) : super(key: key);

  @override
  State<CarPickingScreen> createState() => _CarPickingScreenState();
}

class _CarPickingScreenState extends State<CarPickingScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  List<Image> images = [
    Image.asset('assets/images/e_tron.png'),
    Image.asset('assets/images/Q4_e_tron.png'),
  ];
  var cars;
  int activePage = 0;

  getCars() async {
    //Model of car(id, model, make)
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18),
              child: Center(
                child: Text(
                  "Pick your charging \n port type".toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              width: size.width,
              height: 200,
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page){
                    activePage=page;
                  },
                  itemBuilder: (context, pagePosition){
                    bool active = pagePosition == activePage;//pagePosition==activePage it means true,active = true,otherwise it's false
                    return slider(images,pagePosition,active);

                  }),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activePage)),
            ActionButton("Select", () {
              if(images.length==0){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully added your car " )));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sorry couldn't add your car " )));

              }
            })
          ],
        ),
      ),
    );
  }
  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
          (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.black : Colors.black26,
              shape: BoxShape.circle),
        );
      },
    );
  }
  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(image: images[pagePosition].image),
        //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(
              5.0,
              5.0,
            ), //Offset
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
    );
  }
}
