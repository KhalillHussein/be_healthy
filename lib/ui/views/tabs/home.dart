import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:story_view/story_view.dart';
import '../screens/index.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool showStoryes = false;

  @override
  Widget build(BuildContext context) {
    StoryController storyController = StoryController();
    List<StoryItem> storyItems = [
      StoryItem.inlineImage(
          url: 'https://i.imgur.com/ier2551.png',
          caption: Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          controller: storyController),
      StoryItem.inlineImage(
          url: 'https://i.imgur.com/PVnSDRr.png',
          caption: Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          controller: storyController),
      StoryItem.inlineImage(
          url: 'https://i.imgur.com/No4effU.png',
          caption: Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          controller: storyController),
    ];
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SearchWidget(),
              Container(
                margin: EdgeInsets.all(12),
                height: 148.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                body: StoryView(
                                    storyItems: storyItems,
                                    controller: storyController,
                                    repeat: true,
                                    onStoryShow: (s) {},
                                    onComplete: () => Navigator.pop(context),
                                    onVerticalSwipeComplete: (direction) {
                                      if (direction == Direction.down) {
                                        Navigator.pop(context);
                                      }
                                    }),
                              ),
                              fullscreenDialog: true,
                            ),
                          ),

                          // setState(() {
                          //   showStoryes = true;
                          // })
                        },
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.imgur.com/eyCjAae.png"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          // child: Container(
                          //   margin: EdgeInsets.only(top: 56),
                          //   child: Text(
                          //     "Вакцинация от COVID-19 — зло или возможность?",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       backgroundColor: Colors.black38,
                          //       color: Colors.white,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: InkWell(
                        onTap: () => {
                          setState(() {
                            showStoryes = true;
                          })
                        },
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.imgur.com/4EJuL09.png"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          // child: Container(
                          //   margin: EdgeInsets.only(top: 56),
                          //   child: Text(
                          //     "Вакцинация от COVID-19 — зло или возможность?",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       backgroundColor: Colors.black38,
                          //       color: Colors.white,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: InkWell(
                        onTap: () => {
                          print(showStoryes),
                          setState(() {
                            showStoryes = true;
                          })
                        },
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.imgur.com/GXgZglR.png"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          // child: Container(
                          //   margin: EdgeInsets.only(top: 56),
                          //   child: Text(
                          //     "Вакцинация от COVID-19 — зло или возможность?",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       backgroundColor: Colors.black38,
                          //       color: Colors.white,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                '   Сервисы',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              ServicesWidget(),
              SizedBox(height: 36),
              Text(
                '   Трекеры',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(
                height: 18,
              ),
              TrackersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
/* <<<<<<< HEAD */
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, AppointScreen.route),
                    },
                    child: Container(
                      height: 108,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.purpleAccent.withOpacity(.6),
                              Colors.purpleAccent.withOpacity(.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter),
/* =======
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.pushNamed(context, AppointScreen.route),
                  },
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(12.0),
>>>>>>> dbffa55a903c48d97b217dceb2e281646ffca753 */
                      ),
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'Запись в клинику',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 25,
                            left: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset('assets/Calendar.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, ChatScreen.route),
                    },
                    child: Container(
                      height: 108,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.redAccent.withOpacity(.6),
                              Colors.redAccent.withOpacity(.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter),
                      ),
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    'Онлайн-консультация',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Image.asset('assets/Cloud.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(colors: [
                        Colors.lightBlue.withOpacity(.6),
                        Colors.lightBlue.withOpacity(.2),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text(
                                'Вызов врача на дом',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          left: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Image.asset('assets/Phone.png'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent.withOpacity(.6),
                        Colors.blueAccent.withOpacity(.2),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    ),
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.24,
                              child: Text(
                                'Плановые осмотры',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          left: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Image.asset('assets/Clock.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(colors: [
                        Colors.redAccent.withOpacity(.6),
                        Colors.redAccent.withOpacity(.2),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    ),
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.27,
                              child: Text(
                                'Прием медикоментов',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          left: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Image.asset('assets/Clock-1.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.pushNamed(context, SymptomChatScreen.route),
                  },
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(colors: [
                        Colors.purpleAccent.withOpacity(.6),
                        Colors.purpleAccent.withOpacity(.2),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    ),
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: Text(
                                'Симптом чекер',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 30,
                          left: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Image.asset('assets/Hearts.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrackersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              child: Container(
                height: 108,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.purpleAccent.withOpacity(.6),
                    Colors.purpleAccent.withOpacity(.2),
                  ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                ),
                width: MediaQuery.of(context).size.width * 0.96,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(
                            'Моя активность',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                '1328',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                '/  10000 шагов',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: 0.13,
                          center: new Text(
                            "13%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.white,
                          backgroundColor: Colors.purpleAccent.withOpacity(.6),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              child: Container(
                height: 108,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent.withOpacity(.8),
                    Colors.lightBlueAccent.withOpacity(.4),
                  ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                ),
                width: MediaQuery.of(context).size.width * 0.96,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(
                            'Водный баланс',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                '1940',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                '/  2500 мл',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 13.0,
                          animation: true,
                          percent: 0.77,
                          center: new Text(
                            "77%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.white,
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: Icon(Icons.search_rounded, color: Color(0xFF5C698B)),
            filled: true,
            hintStyle: TextStyle(color: Color(0xFF5C698B), letterSpacing: 0.15),
            hintText: "ФИО, специальность или болезнь",
            fillColor: Color(0xFFF4F5FC)),
      ),
    ));
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Главная',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(0xFF0B225A),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                      fontSize: 34,
                    ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/Notify.png'),
                padding: EdgeInsets.all(15),
                splashRadius: 20,
              )
            ],
          )),
    );
  }
}
