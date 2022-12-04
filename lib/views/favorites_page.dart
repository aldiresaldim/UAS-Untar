import 'package:flutter/material.dart';
import 'package:marvel/components/text_style_widget.dart';
import 'package:provider/provider.dart';
import '../constants/image_constants.dart';
import '../constants/string_constants.dart';
import '../controller/favourites_controller.dart';
import '../utils/routes.dart';
import 'details_page.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var str;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Favorites>(context);

    return Scaffold(
      backgroundColor: Colors.black54,
      body: provider.listFavorites.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cardMovie(constraints, context),
                    const SizedBox(height: 20),
                    _favoritesText(),
                    const SizedBox(height: 10),
                    _favoritesListMovie(constraints, provider),
                  ],
                ),
              ),
            ),
    );
  }

  _favoritesText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        StringConstants.favorites,
        style: AppTextStyle.font22,
      ),
    );
  }

  _favoritesListMovie(
    BoxConstraints constraints,
    Favorites provider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: constraints.maxHeight / 2,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.listFavorites.length,
            itemBuilder: (context, index) {
              var lista = provider.listFavorites[index];
              str = lista.title.toString();
              while (str.trim().length > 23) {
                str = str.toString().substring(0, 23);
              }
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight / 2.8,
                    width: constraints.maxWidth / 2 - 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                        data: lista,
                                      )));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          elevation: 5,
                          child: Image.network(
                            lista.coverUrl.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(str.toString()),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 60,
                          child: Image.asset(ImageConstants.imageAsset5Stars,color: Colors.amber),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('8.5', style: AppTextStyle.font15),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  _cardMovie(BoxConstraints constraints, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: constraints.maxHeight / 2.2,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstants.favoritesCardMovie),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            height: constraints.maxHeight / 2.2,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    StringConstants.InfoCard,
                    style: AppTextStyle.font22,
                  ),
                ),
              ],
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
      ],
    );
  }
}
