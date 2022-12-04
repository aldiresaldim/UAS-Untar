import 'package:flutter/material.dart';
import 'package:marvel/components/text_style_widget.dart';
import 'package:marvel/constants/string_constants.dart';
import 'package:marvel/controller/favourites_controller.dart';
import 'package:provider/provider.dart';
import '../components/star_list_widget.dart';
import '../constants/error_constants.dart';
import '../controller/mylist_controller.dart';
import '../data/models/marvel_models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../utils/routes.dart';

class DetailsPage extends StatefulWidget {
  Data? data;

  DetailsPage({Key? key, this.data}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: movieDetails(),
    );
  }

  Padding movieDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _cardMovie(),
            const SizedBox(height: 20),
            _infoDetailsMovie(),
            const SizedBox(height: 20),
            _sumaryText(),
            _overwiewText(),
            _atoresText(),
            const StarListWidget(),
          ],
        ),
      ),
    );
  }

  _atoresText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        StringConstants.actors,
        style: AppTextStyle.font22,
      ),
    );
  }

  _overwiewText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(widget.data!.overview.toString()),
    );
  }

  _sumaryText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        StringConstants.sumary,
        style: AppTextStyle.font25Bold,
      ),
    );
  }

  _infoDetailsMovie() {
    return Row(
      children: [
        const SizedBox(width: 20),
        Text(
          (DateFormat("yyyy")
              .format(DateTime.parse(widget.data!.releaseDate.toString()))),
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 15),
        const Text('|'),
        const SizedBox(width: 15),
        Text(
          widget.data!.duration.toString(),
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          StringConstants.minutes,
          style: AppTextStyle.font15,
        ),
        const SizedBox(width: 8),
        const Text('|'),
        const SizedBox(width: 10),
        Container(
          alignment: Alignment.center,
          height: 15,
          child: const Icon(Icons.star,color: Colors.amber,size: 18),
        ),
        const SizedBox(width: 10),
        Text('8.5', style: AppTextStyle.font15),
        const SizedBox(width: 20),
        Container(
          alignment: Alignment.topLeft,
          height: 36,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black26,
          ),
          child: Row(
            children: [
              Consumer<MyListController>(
                builder: (context, value, child) => IconButton(
                  onPressed: () {
                    value.myListOnly(widget.data!);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(StringConstants.addMyList)));
                  },
                  icon: Icon(
                    value.myList.contains(widget.data)
                        ? Icons.check_circle_outline
                        : Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                StringConstants.myList,
                style: AppTextStyle.font14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _cardMovie() {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Image.network(
              widget.data!.coverUrl.toString(),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 25,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white12),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.HOME);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          left: 170,
          top: 100,
          child: InkWell(
            onTap: _callVideoPlayer,
            child: const Icon(
              Icons.play_circle_outline,
              color: Colors.yellow,
              size: 65,
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 25,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white12),
            child: Consumer<Favorites>(
              builder: (context, provider, child) => IconButton(
                onPressed: () {
                  provider.toogleFavorite();
                  _favoritesController(provider, context);
                },
                icon: Icon(
                  provider.listFavorites.contains(widget.data)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _favoritesController(Favorites provider, BuildContext context) {
    if (!provider.listFavorites.contains(widget.data)) {
      provider.listFavorites.add(widget.data!);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(StringConstants.addMyfavorites)));
    } else {
      provider.listFavorites.remove(widget.data!);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(StringConstants.removeFavorites)));
    }
  }

  Container container() {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
    );
  }

  _callVideoPlayer() async {
    final url = widget.data!.trailerUrl.toString();
    if (await launch(url)) {
      await launch(
        url,
        enableJavaScript: true,
        forceWebView: true,
      );
    } else {
      throw ErrorConstants.videoNaoDisponivel + url;
    }
  }
}
