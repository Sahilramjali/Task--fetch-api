import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:demoapp/Model/DemoModel.dart';
import 'package:flutter_svg/svg.dart';
import '../services/service.dart';
import 'package:demoapp/common Widgets/widget.dart';
import 'appointment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DemoModel>? Data;
  final _searchController = TextEditingController();
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    Data = await Services().fetchDataService();
    if (Data != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 130,
              child: AppBar(
                  backgroundColor: const Color.fromARGB(255, 26, 113, 137),
                  actions: [
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SvgPicture.asset(
                            'assets/filter_list.svg',
                            color: Colors.white,
                            height: 30,
                            width: 30,
                          ),
                        ))
                  ],
                  title: const Text(
                    '      Doctors',
                    textAlign: TextAlign.start,
                  ),
                  elevation: 0.0,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                    ),
                    iconSize: 45,
                    onPressed: () {},
                  ),
                  leadingWidth: 0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 241, 246),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          40, 25, 40, 15), //padding of search
                      child: Center(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            hintText: 'SEARCH',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: const IconButton(
                              icon: Icon(Icons.search, color: Colors.blue),
                              iconSize: 45,
                              onPressed: null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Visibility(
                        visible: isLoaded,
                        child: ListView.builder(
                          itemCount: Data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              //margin of card on both horizental and vertical axis
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 1),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 5, left: 15),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.loose,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 40,
                                        ),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/doctor.jpg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: TextWidget(
                                                  text: Data![index].title,
                                                  size: 16,
                                                  color: const Color.fromARGB(
                                                      255, 26, 113, 137),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Text(
                                                Data![index].body ?? '',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 11, top: 15, bottom: 0),

                                              //custom widget
                                              child: ButtonWidget(
                                                text: "click for appointment",
                                                function: () => {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Appointment()))
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //custom widget
                                            const TextWidget(
                                              text: "lang",
                                              size: 13,
                                              color: Colors.black,
                                            ),
                                            //custom widget
                                            const TextWidget(
                                              text: "English,Nepali",
                                              size: 15,
                                              color: Colors.black,
                                            ),
                                            //custom widget
                                            const TextWidget(
                                              text: "Price",
                                              size: 16,
                                              color: Color.fromARGB(
                                                  255, 26, 113, 137),
                                            ),
                                            const TextWidget(
                                              text: "Rs.1000",
                                              size: 14,
                                              color: Color.fromARGB(
                                                  255, 26, 113, 137),
                                            ),
                                            RatingBar.builder(
                                              initialRating:
                                                  5, //done to match the rating
                                              minRating: 1,
                                              itemSize: 20,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 26, 113, 137),
                                              ),
                                              onRatingUpdate:
                                                  (rating) {}, //used to code for storing state or updating rating
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 9,
                                              ),
                                              child: ButtonWidget(
                                                text: "click for appointment",
                                                function: () => {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Appointment()))
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
