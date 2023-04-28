import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  final bool showButton;
  const CustomBookImage(
      {super.key, this.showButton = false, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
        child: showButton
            ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.withOpacity(0.6),
                    child: const Icon(
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
