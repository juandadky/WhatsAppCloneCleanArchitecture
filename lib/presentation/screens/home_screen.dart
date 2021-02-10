import 'package:flutter/material.dart';
import 'package:whatsapp_clone_clean/presentation/pages/calls_page.dart';
import 'package:whatsapp_clone_clean/presentation/pages/camera_page.dart';
import 'package:whatsapp_clone_clean/presentation/pages/chat_page.dart';
import 'package:whatsapp_clone_clean/presentation/pages/status_page.dart';
import 'package:whatsapp_clone_clean/presentation/widgets/custom_tab_bar.dart';
import 'package:whatsapp_clone_clean/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({Key key, this.uid}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> _pages = [CameraPage(),ChatPage(),StatusPage(),CallsPage()];

  _buildSearch(){
    return SafeArea(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              offset: Offset(0.0,0.50)
            )
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: InkWell(
              onTap: (){
                setState(() {
                  _isSearch = false;
                });
              },
              child: Icon(Icons.arrow_back)
            )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex!= 0  ? AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: _isSearch==false?primaryColor: Colors.transparent,
        title: _isSearch==false ? Text('WhatsApp Clone'): Container(height: 0.0,width: 0.0,),
        flexibleSpace: _isSearch==false?Text('', style: TextStyle(fontSize: 0.0),): _buildSearch(),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                _isSearch = true;
              });
            },
            child: Icon(Icons.search)
          ),
          SizedBox(width: 5,),
          Icon(Icons.more_vert)
        ],
      ): null,
      body: Column(
        children: [
          _isSearch==false
            ? _currentPageIndex!= 0 
              ? CustomTabBar(index: _currentPageIndex) 
              : Container() 
            : Container(),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index){
                setState(() {
                  _currentPageIndex=index;
                });
              },
              itemBuilder: (_,index){
                return _pages[index];;
              }
            ),
          )
        ],
      ),
    );
  }
}