import 'package:flutter/material.dart';

class MyHeroWidget extends StatefulWidget {
  final String urlLogo, storeName;

  const MyHeroWidget(this.urlLogo, this.storeName, {Key key}) : super(key: key);

  @override
  State<MyHeroWidget> createState() => _MyHeroWidgetState();
}

class _MyHeroWidgetState extends State<MyHeroWidget> {
  @override
  Widget build(BuildContext context) {
    var timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.storeName),
      ),
      body: PhotoHero(
        photo: widget.urlLogo,
        storeName: widget.storeName,
        width: 300.0,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Flippers Page'),
                ),
                body: PhotoHero(
                  photo: widget.urlLogo,
                  storeName: widget.storeName,
                  width: 100.0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key,
      this.photo,
      this.onTap,
      this.width,
      this.heigth,
      this.storeName})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width, heigth;
  final String storeName;

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Hero(
            tag: photo,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Wrap(
                  children: [
                    Image.network(
                      photo,
                      fit: BoxFit.fill,
                    ),
                    Spacer(),
                    Text(storeName),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
