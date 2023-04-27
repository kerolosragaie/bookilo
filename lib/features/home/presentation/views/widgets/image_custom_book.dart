import 'package:flutter/material.dart';
import '../../../../../core/constants/assets_data.dart';

class CustomBookImage extends StatelessWidget {
  final bool showButton;
  const CustomBookImage({super.key, this.showButton = false});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.kBookCoverEx),
          ),
        ),
        child: showButton
            ? const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.play_arrow,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
