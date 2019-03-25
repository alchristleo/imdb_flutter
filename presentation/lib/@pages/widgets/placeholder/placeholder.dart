import 'package:flutter/material.dart';
import 'package:imdb_flutter/@global/colors.dart';

class MoviePlaceholder extends StatelessWidget {
    const MoviePlaceholder() : super();

    Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
            margin: const EdgeInsets.all(4),
            child: new Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),
                color: colorBlackGradient92,
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        AspectRatio(
                            aspectRatio: 16.0 / 9.0,
                            child: Image.asset(
                                "assets/images/image-placeholder.png",
                                fit: BoxFit.cover,
                            )
                        ),
                        new Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    new Text(
                                        '        ',
                                        style: TextStyle(background: Paint()..color = colorBlackGradient70),
                                    ),
                                ],
                            )
                        ),
                        new Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    new Text(
                                        '                 ',
                                        style: TextStyle(background: Paint()..color = colorBlackGradient70),
                                    ),
                                ],
                            )
                        ),
                    ],
                )
            ),
        ),
    );

    Widget _buildImageRow(int imageIndex) => Row(
        children: [
            _buildDecoratedImage(imageIndex),
            _buildDecoratedImage(imageIndex + 1),
        ],
    );

    @override
    Widget build(BuildContext context) {
        return GridView.count(
            crossAxisCount: 1,
            padding: EdgeInsets.all(4.0),
            childAspectRatio: 2.3,
            children: <Widget>[
                _buildImageRow(1),
                _buildImageRow(3),
                _buildImageRow(5),
                _buildImageRow(7),
            ],
        );
    }
}
