import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  final double scrollOffset;

  Widget buildCategories(BuildContext context, String text, Function onTap) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      color: Colors.black.withOpacity(
        (scrollOffset / 350).clamp(0, 1).toDouble(),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.network(
            //   "data:image/png;base64,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",
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('TV Shows'),
                ),
                // buildCategories(context, 'Tv Shows', () {}),
                // buildCategories(context, 'Movies', () {}),
                // buildCategories(context, 'My List', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
