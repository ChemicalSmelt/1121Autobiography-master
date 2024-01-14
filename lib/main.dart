import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MaterialApp(home: MyApp(), ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => Screen();
}

class Screen extends State<MyApp> with SingleTickerProviderStateMixin {

  String imageLink='images/background.png';
  var particles= const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 100,
    spawnMinSpeed: 30,
    spawnMaxSpeed: 100,
    spawnMinRadius: 7,
    spawnMaxRadius: 15,
  );

  @override
  void initState() {
    super.initState();
    /*
    * Twin Musicom創作的「That's That (Sting)」是依據 創用 CC (姓名標示) 4.0 授權使用。 https://creativecommons.org/licenses/by/4.0/
      藝人： http://www.twinmusicom.org/
    * */
    player.play(AssetSource("That'sThat.mp3"));
    Timer(const Duration(seconds:10), (){
      player.stop();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的自傳', textDirection: TextDirection.ltr),),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options:particles),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.purple,
                      width:5,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(imageLink),
                      fit: BoxFit.cover),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height:10),
              const Text("我的自傳", textAlign: TextAlign.center,textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 40,
                    fontFamily: "Thin",
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});
  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {

  final tabs=[
    screen1(),
    const screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("TwoHearts-TrackTribe.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: const Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.jpg',width:40,height:40): Image.asset('images/f1.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('TwoHearts-TrackTribe.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('LittleUmbrellas-TrackTribe.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('NoIndication-TrackTribe.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('TopOfTheMorning-TrackTribe.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='\t我是一位來自平凡家庭的大學生，成長在一個普通家庭，父親是一位工人，經常需要到外地工作，母親是一位作業員，在一家生產各式桶子的工廠上班。家庭管教採自主約束的方式，這樣的背景不僅塑造了我的性格，也激發了我對各種事物的好奇。\n'
  '\t在大學的學習過程中，我專攻資訊工程，主要集中於資訊安全和人工智慧領域。我是一名初學者，正在不斷努力學習和探索。目前，我熟悉的程式語言包括C/C++、Java和Python。此外，我在本學期學習了Flutter，拓展了我的移動應用程式開發能力。\n'
  '\t我的學業不僅是為了追求知識，更是為了實現未來在資訊安全和人工智慧領域的職業目標。我對於解決複雜的問題充滿熱情，並且喜歡挑戰自己以不斷提升技能。我的夢想是能夠在這個充滿創新和挑戰的領域中發揮所長，為社會做出積極的貢獻。\n'
  '\t除了學術方面，我還對個人成長和團隊合作感興趣。我相信不斷學習和不怕挑戰的態度是取得成功的關鍵。這種信念激勵我參與各種項目，與同學共同合作，共同攜手迎接挑戰。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: const TextStyle(fontSize: 20, fontFamily: 'Thin')),
          ),
          const SizedBox(height: 10,),

          Container(
            color: Colors.redAccent,
            height: 400,
            width: 400,
            child:Image.asset('images/f1.jpg'),
          ),

        ],
      ),
    );
  }
}

class Item{
  final String title;
  final String content;
  final String imagePath;
  bool isChecked = false;
  Item({required this.title, required this.content, required this.imagePath});
}

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  late List<Item> mList;
  var currentIndex = -1;
  @override
  void initState(){
    super.initState();
    mList = [];
    mList.add(Item(title: '國小', content: '高雄市立王公國小', imagePath: 'images/ElementarySchool.jpg'));
    mList.add(Item(title: '國中', content: '高雄市立林園國中', imagePath: 'images/JuniorHighSchool.JPG'));
    mList.add(Item(title: '高中', content: '高雄市立中正高級工業職業學校', imagePath: 'images/HighSchool.jpg'));
    mList.add(Item(title: '大學', content: '國立高雄科技大學建工校區', imagePath:'images/University.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded){
              setState(() {
                mList[index].isChecked = isExpanded;
              });
            },
            children: mList.map<ExpansionPanel>((Item i){
                return ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded){
                    return ListTile(
                      title: Text(i.title),
                      tileColor: Colors.grey,
                      textColor: Colors.black87,
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListBody(
                      children: [
                        ListTile(
                          title : Text(i.content),
                        ),
                        Container(
                          width: 150,
                          height:150,
                          decoration: BoxDecoration(
                            border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: AssetImage(i.imagePath), fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )
                  ),
                  isExpanded: i.isChecked,
                );
              }
            ).toList(),
          ),
      ),
    );
  }
}

class LearningHistoryItem extends StatelessWidget {
  final String year;
  final List<String> learningItems;
  final String svgPath;

  const LearningHistoryItem({super.key, required this.year, required this.learningItems, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 40.0,
              width: 40.0,
            ),
            Text(
              year,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: learningItems.map((item) => Text("- $item")).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('學習計畫', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LearningHistoryItem(
                year: '大一',
                learningItems: ['學好程式基礎(從C++開始)', '了解基礎網路', '學習常見算法', '持續英文學習'],
                svgPath: 'images/1.svg',
            ),
            LearningHistoryItem(
                year: '大二',
                learningItems: ['學習資料結構', '熟悉物件導向', '了解基礎資安', '搞懂機器學習', '完成小專題'],
              svgPath: 'images/2.svg',
            ),
            LearningHistoryItem(
                year: '大三',
                learningItems: ['摸透深度學習', '參加CTF', '完成大量專題', '學習推薦系統', '生成式AI'],
              svgPath: 'images/3.svg',
            ),
            LearningHistoryItem(
                year: '大四',
                learningItems: ['提前畢業', '準備研究所', '參與實習', '和教授一同完成獨立專題'],
              svgPath: 'images/4.svg',
            ),
          ],
        ),
      )
    );
  }
}

class ProfessionalDirectionItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLeftAligned;

  ProfessionalDirectionItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLeftAligned,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (isLeftAligned)
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
          ),
          if (!isLeftAligned)
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  final List<String> titles = [
    '資訊安全領域',
    '網路安全',
    '逆向工程',
    '人工智慧領域',
    '機器學習',
  ];

  final List<String> descriptions = [
    '資訊安全是一個廣泛的領域，旨在保護組織、個人和國家的數據、系統和網絡免受未經授權的訪問、損害或泄漏...',
    '網路安全是資訊安全領域的一個重要分支，專注於保護計算機系統、網絡架構和數據傳輸免受未經授權的訪問、損害和惡意攻擊...',
    '逆向工程是一種分析和理解已有產品、軟體或硬體的過程，以揭示其內部運作、結構和設計。這種技術通常被用於破解軟體保護、解密編碼、查找漏洞、或者瞭解製品的工作原理...',
    '人工智慧（Artificial Intelligence，簡稱AI）是一個涵蓋廣泛的科技領域，旨在使機器能夠執行通常需要人類智慧的任務...',
    '機器學習（Machine Learning，簡稱ML）是人工智慧（AI）的一個分支，它致力於開發能夠自動學習並改進的算法，而無需明確的程序規則',
  ];

  final List<String> imagePaths = [
    'images/informationSecurity.jpg',
    'images/webSecurity.jpg',
    'images/reverseEngineering.jpg',
    'images/ai.jpg',
    'images/machineLearning.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('專業方向'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ProfessionalDirectionItem(
            title: titles[index],
            description: descriptions[index],
            imagePath: imagePaths[index],
            isLeftAligned: index % 2 == 0,
          );
        },
      ),
    );
  }
}