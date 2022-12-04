import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/components/text_style_widget.dart';
import 'package:provider/provider.dart';

import '../controller/marvel_controller.dart';
import '../data/models/marvel_models.dart';
import '../views/details_page.dart';

class Top10List extends StatefulWidget {
  const Top10List({Key? key}) : super(key: key);

  @override
  State<Top10List> createState() => _Top10ListState();
}

class _Top10ListState extends State<Top10List> {
  List<Data> lista = [];
  var str;

  MarvelController controller = MarvelController();

  @override
  void initState() {
    controller = context.read<MarvelController>();
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.7,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.lista.length,
            itemBuilder: (context, index) {
              var list = controller.lista.sublist(9)[index];
              str = controller.lista[index].title.toString();
              while (str.trim().length > 23) {
                str = str.toString().substring(0, 23);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width / 2 - 9,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      data: list,
                                    )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: list.coverUrl.toString(),
                          child: Image(
                            image: CachedNetworkImageProvider(
                              list.coverUrl.toString(),
                              maxHeight: 260,
                              maxWidth: 200,
                            ),
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              );
                            },
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 20,
                      width: 175,
                      child: Text(
                        str,
                        style: AppTextStyle.font14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 20,
                      width: 175,
                      child: const Text(
                        'Action Adventure',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                        alignment: Alignment.topLeft,
                        height: 40,
                        width: 175,
                        child: Row(
                          children: [
                            if (str == 'Iron Man' ||
                                str == 'Thor' ||
                                str == 'Spirder Man' ||
                                str == 'Iron Man 2')
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
