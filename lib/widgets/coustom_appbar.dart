import 'package:flutter/material.dart';
import 'package:netflix/assets.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      color: Colors.transparent,
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              Assets.netflixLogo0,
              height: 40,
            ),
            Expanded(
              child: Row(
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
