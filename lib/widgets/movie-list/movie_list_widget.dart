import 'package:flutter/material.dart';
import 'package:tm_db/app_images/app_images.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 2)),
                      ],
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AppImages.prison),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 20),
                            Text('The Shawshank Redemption',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 5),
                            Text('September 10, 1994',
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 20),
                            Text(
                                'Accountant Andy Dufresne is accused of murdering his '
                                    'own wife and her lover. Once in a prison called '
                                    'Shawshank, he is faced with cruelty and '
                                    'lawlessness reigning on both sides of the bars. '
                                    'Everyone who gets into these walls becomes their '
                                    'slave for the rest of their lives. But Andy, who '
                                    'has a lively mind and a kind soul, finds an '
                                    'approach to both prisoners and guards, seeking '
                                    'their special favor.',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),

                          ],
                        ),

                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          );
        });
  }
}
