import 'package:flutter/material.dart';



class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  SearchScreen({Key? key}) : super(key: key);
   String text='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: VerticalDivider(
                    width: 7,
                    color:Color(0xff9661c9) ,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (s){
                      text=s;
                    },
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey[500]),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search by Spare name',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(
                          fontSize: 13.5, color: Colors.grey[300]),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: (){
                  },
                  child: const Icon(
                    Icons.search,
                    color: Color(0xff9661c9),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 10,
              color: Colors.grey[500],
            ),
          ),

        ],
      ),
    ),
    );
  }
}
