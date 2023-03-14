import 'package:flutter/material.dart';
import 'package:tm_db/app_images/app_images.dart';
import 'package:tm_db/elements/radial_percent_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: _MovieName(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        _OverViewWidget(),
        _MovieDescriptionWidget(),
        SizedBox(height: 25),
        _StuffWidget(),
      ],
    );
  }
}

class _StuffWidget extends StatelessWidget {
  const _StuffWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Stefano Sollima',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: nameStyle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Stefano Sollima',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: nameStyle,
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Stefano Sollima',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: nameStyle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Stefano Sollima',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: nameStyle,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _MovieDescriptionWidget extends StatelessWidget {
  const _MovieDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Overview',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
        child: Text(
          'R, 04/29/2021 (US) 1h49m Action, Adventure, Thriller, War',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: RadialPercentWidget(
                      percent: 0.72,
                      fillColor: Color.fromARGB(255, 10, 23, 25),
                      lineColor: Color.fromARGB(255, 37, 203, 103),
                      freeColor: Color.fromARGB(255, 25, 54, 31),
                      lineWidth: 3,
                      child: Center(
                          child: Text(
                        '72',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('User Score', style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton(onPressed: () {}, child: Row(
          children: const [
            Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text('Play Trailer', style: TextStyle(color: Colors.white)),
          ],
        )),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AppImages.smallImage),
        Positioned(
            top: 20,
            bottom: 20,
            left: 5,
            child: Image(
                image: AppImages.withoutRemorse, height: 200, width: 150)),
      ],
    );
  }
}

class _MovieName extends StatelessWidget {
  const _MovieName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 3,
        text: const TextSpan(children: [
          TextSpan(
            text: 'Tom Clancy\'s without Remorse',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ]));
  }
}
