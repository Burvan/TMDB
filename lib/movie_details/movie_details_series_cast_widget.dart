import 'package:flutter/material.dart';
import 'package:tm_db/app_images/app_images.dart';

class MovieDetailsSeriesCastWidget extends StatelessWidget {
  const MovieDetailsSeriesCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Series Cast', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),),
          ),
          SizedBox(
            height: 320,
            child: Scrollbar(
              child: ListView.builder(
                //clipBehavior: Clip.hardEdge,
                itemExtent: 130,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 2)),
                        ],
                        border:
                        Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          const Image(image: AppImages.profilePhoto),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Steven Yeun',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 7),
                                Text('Mark Grayson / invincible',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 7),
                                Text('8 episodes',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  )
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextButton(onPressed: (){}, child: const Text(
                'Full Cast & Crew', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              color: Colors.black,

            ),

            ),
            ),
          ),
        ],
      ),
    );
  }
}
