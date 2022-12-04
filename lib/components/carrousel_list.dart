import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/marvel_controller.dart';
import '../data/models/marvel_models.dart';
import '../views/details_page.dart';

class CarrouselList extends StatefulWidget {
  const CarrouselList({Key? key}) : super(key: key);

  @override
  State<CarrouselList> createState() => _CarrouselListState();
}

class _CarrouselListState extends State<CarrouselList> {
  int activeIndex = 0;
  List<Data> lista = [];

  MarvelController controller = MarvelController();

  @override
  void initState() {
    controller = context.read<MarvelController>();
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: CarouselSlider.builder(
            itemCount: controller.lista.length,
            options: CarouselOptions(
              enlargeCenterPage: true,
              initialPage: 6,
              height: MediaQuery.of(context).size.height / 3.5,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              aspectRatio: 5.0,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemBuilder: (context, index, id) {
              return (index <= 0)
                  ? Container()
                  : GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            controller.lista[index].coverUrl.toString(),
                            width: 420,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      data: controller.lista[index],
                                    )));
                      },
                    );
            },
          ),
        ),
        const SizedBox(height: 10),
        buildIndicator(controller),
      ],
    );
  }

  buildIndicator(controller) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: controller.lista.length,
        effect: const ScrollingDotsEffect(
          dotHeight: 10,
          dotWidth: 12,
          activeDotColor: Colors.white,
          dotColor: Colors.grey,
        ),
      );
}
