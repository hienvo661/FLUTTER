// ignore_for_file: unnecessary_import, unused_local_variable, unused_import
import 'dart:math';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:f2_flutter_ecommerce_app/models/english_today.dart';
import 'package:f2_flutter_ecommerce_app/packages/quote/qoute_model.dart';
import 'package:f2_flutter_ecommerce_app/packages/quote/quote.dart';
import 'package:f2_flutter_ecommerce_app/pages/Showmore2_page.dart';
import 'package:f2_flutter_ecommerce_app/pages/Showmore_page.dart';
import 'package:f2_flutter_ecommerce_app/pages/control_page.dart';
import 'package:f2_flutter_ecommerce_app/pages/favorites_page.dart';
import 'package:f2_flutter_ecommerce_app/values/app_assets.dart';
import 'package:f2_flutter_ecommerce_app/values/app_colors.dart';
import 'package:f2_flutter_ecommerce_app/values/app_styles.dart';
import 'package:f2_flutter_ecommerce_app/values/share_keys.dart';
import 'package:f2_flutter_ecommerce_app/widget_Button/drawer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentindex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.9);

// hàm random english
  List<englishtoday> words = [];

  String? contentwords = Quotes().getRandom().content;

  List<int> fixedListRandom({
    int len = 1,
    int max = 120,
    int min = 1,
  }) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newlist = [];
    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newlist.contains(val)) {
        continue;
      } else {
        newlist.add(val);
        count++;
      }
    }
    return newlist;
  }

//init chổ này. init nó không có đợi.
  Future getEnglishtoday() async {
    print('before await');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("after await");
    int chieudai = prefs.getInt(ShareKeys.counter) ?? 6;
    List<String> newList = [];
    List<int> rans = fixedListRandom(len: chieudai, max: nouns.length);
    rans.forEach((index) {
      newList.add(nouns[index]);
    });
    print("has data");
    // words = newList.map((e) => englishtoday(noun: e)).toList();
    // sau khi gán giá trị xong phải rebuild lại layout bằng setState
    setState(() {
      words = newList.map((e) => getQuote(e)).toList();
    });
    // setState(() {
    //   words = newList.map((e) => getQuote(e)).toList();
    // });
  }

  englishtoday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return englishtoday(
      noun: noun,
      quote: quote?.content,
      id: quote?.id,
    );
  }

  @override
  void initState() {
    super.initState();
    getEnglishtoday();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, //xoá viền dưới của appbar
        title: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            "English Today",
            style:
                AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
          ),
        ),
        //inkwell là widget cho phép click sự kiện
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
            // sự kiện ontap
            print("Open Drawer With Key Global");
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      //------------------------------------------------------------------------
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: size.height * 1 / 10,
              alignment: Alignment.centerLeft,
              child: Text(
                '"$contentwords"',
                style: AppStyles.h4
                    .copyWith(color: AppColors.textColor, fontSize: 15),
              ),
            ),
            words.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: size.height * 6 / 10,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentindex = index;
                        });
                      },
                      itemCount: words.length > 6 ? 7 : words.length,
                      itemBuilder: (context, index) {
                        // trường hợp lúc chưa init xong cái list bị rỗng ngay chổ này nó return về container.
                        // if (words.isEmpty) {
                        //   return buildIndicator(index == _currentindex, size);
                        //   // return Container();
                        //   // chổ này thay bằng loading nha. đừng return container
                        // }
                        // sau khi gán giá trị xong thì rebuild lauout nó sẽ chạy xuống đây

                        String firstText = words[index].noun ?? '';
                        firstText = firstText.substring(0, 1);
                        String secondText =
                            words[index].noun != null ? words[index].noun! : '';
                        secondText = secondText.substring(1, secondText.length);
                        String quotesDefault =
                            "Life isn’t about finding yourself. Life is about creating yourself.";
                        String quote = words[index].quote != null
                            ? words[index].quote!
                            : quotesDefault;

                        return Padding(
                          // cái khung nội dung
                          padding: const EdgeInsets.all(7),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primaryColor,
                            elevation: 4,
                            child: _currentindex >= 6
                                ? InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ShowmoreWidgetPage2(
                                                      wordss: this.words)));
                                    },
                                    splashColor: AppColors.lighBlue,
                                    child: Center(
                                      child: Text(
                                        'Show more...',
                                        style: AppStyles.h4.copyWith(shadows: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(1, 3),
                                            blurRadius: 2,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        LikeButton(
                                          onTap: (bool isLiked) async {
                                            setState(() {
                                              words[index].isFavorites =
                                                  !words[index].isFavorites;
                                            });
                                            return words[index].isFavorites;
                                          },
                                          isLiked: words[index].isFavorites,
                                          padding: EdgeInsets.only(
                                              right: 15, top: 10),
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          size: 45,
                                          circleColor: CircleColor(
                                              start: Color(0xff00ddff),
                                              end: Color(0xff0099cc)),
                                          bubblesColor: BubblesColor(
                                            dotPrimaryColor: Color(0xff33b5e5),
                                            dotSecondaryColor:
                                                Color(0xff0099cc),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return ImageIcon(
                                              AssetImage(
                                                AppAssets.heart,
                                              ),
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                            );
                                            // return Icon(
                                            //   Icons.favorite,
                                            //   color: isLiked
                                            //       ? Colors.red
                                            //       : Colors.grey,
                                            //   size: 45,
                                            // );
                                          },
                                        ),
                                        // Container(
                                        //   padding: EdgeInsets.only(
                                        //       right: 10, top: 10),
                                        //   alignment: Alignment.centerRight,
                                        //   child: Image.asset(
                                        //     AppAssets.heart,
                                        //     color: words[index].isFavorites
                                        //         ? Colors.red
                                        //         : Colors.white,
                                        //   ),
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: RichText(
                                            maxLines:
                                                1, // không cho chữ xuống hàng khi chữ quá dài
                                            overflow: TextOverflow
                                                .ellipsis, // khi chữ quá dài thì sẽ ....
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              text: firstText,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 98,
                                                fontFamily: 'sen',
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black38,
                                                      offset: Offset(3, 5),
                                                      blurRadius: 6),
                                                ],
                                              ),
                                              children: [
                                                TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 50,
                                                  ),
                                                  text: secondText,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, left: 20),
                                                child: AutoSizeText(
                                                  '"$quote"',
                                                  maxFontSize:
                                                      26, //size phải lớn hơn size font mặc định
                                                  style: AppStyles.h4.copyWith(
                                                    letterSpacing: 1,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
            // _currentindex >= 6
            //     ? Showmore()
            //     :
            // hàm indicator ở đây
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: SizedBox(
                  height: size.height * 1 / 14.84,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: words.length >= 5 ? 6 : words.length,
                        itemBuilder: (context, index) {
                          return buildIndicator(index == _currentindex, size);
                        }),
                    // child: Row(
                    //   children: List.generate(
                    //       words.length,
                    //       (index) =>
                    //           buildIndicator(index == _currentindex, size)),
                    // ),
                  )),
            ),
          ],
        ),
      ),
      //------------------------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          print('reload');
          setState(() {
            getEnglishtoday();
          });
        },
        child: Image.asset(AppAssets.exchange),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lighBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 18,
                ),
                child: Text(
                  'Your mind',
                  style: AppStyles.h3.copyWith(color: AppColors.textColor),
                ),
              ),
              //button 1
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: drawer_button(
                  label: 'Favorites',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_HomepageState) => FavoritePage()),
                    );
                    print('Ontap Favorites');
                  },
                ),
              ),
              //button 2
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: drawer_button(
                  label: 'Your Control',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_HomepageState) => YourControlPage()),
                    );
                    print('Ontap YourControlPage');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // hàm thuộc tính indicator
  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      //các thuộc tính vuốt
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: isActive ? size.width * 1 / 6 : 22,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lighBlue : AppColors.lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2, 3),
              blurRadius: 3,
            ),
          ]),
    );
  }

  // Widget Showmore() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //     alignment: Alignment.centerLeft,
  //     child: Material(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       elevation: 3,
  //       color: AppColors.primaryColor,
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (_) => ShowmoreWidgetPage(wordss: this.words),
  //             ),
  //           );
  //         },
  //         splashColor: Colors.black38,
  //         borderRadius: BorderRadius.all(Radius.circular(20)),
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //           child: Text(
  //             "Show more",
  //             style: TextStyle(),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
