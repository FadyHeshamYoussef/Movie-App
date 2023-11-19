import 'package:flutter/material.dart';

import '../movie/model.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieModel  model;
  const MovieDetailsView({Key?key, required this.model}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Details"),),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Image.network(
                 model.image,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        model.subTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Column(
                         children: [
                           Row(
                             children: [
                               const Text(
                                 "Language: ",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.black,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                               Text(
                                  model.originalLanguage,
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Theme.of(context).hintColor,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 16,),
                           Row(
                             children: [
                               const Text(
                                 "popularity: ",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.black,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                               Text(
                                 model.popularity.toString(),
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Theme.of(context).hintColor,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 16,),
                           Row(
                             children: [
                               const Text(
                                 "Date: ",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.black,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                               Text(
                                 model.date.toString(),
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Theme.of(context).hintColor,
                                   // color: Theme.of(context).hintColor,
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                      const SizedBox(height: 16,),
                       Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                              "Rating: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                          ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            model.rating.toString(),
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
