import 'package:flutter/material.dart';
import 'package:marvel/components/text_style_widget.dart';
import '../constants/image_constants.dart';
class StarListWidget extends StatelessWidget {
  const StarListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage(ImageConstants.imageAssetcrisEvans),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 50,
                  child:  Text(
                    ' Chris Evans',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage(ImageConstants.imageAssetscarlet),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 80,
                  child:  Text(
                    '   Scarlett Johansson',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/Cris hemsworthr.jpg'),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 84,
                  child: Text(
                    'Chris Hemsworth',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/robert downey jr.jpg'),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 75,
                  child:  Text(
                    '  Robert Downey Jr',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/mark huffalo.jpg'),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 50,
                  child:  Text(
                    'Mark Ruffalo',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children:  [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/Samuel ljackson.jpg'),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 70,
                  child: Text(
                    'Samuel Ljackson',style: AppTextStyle.font14,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}