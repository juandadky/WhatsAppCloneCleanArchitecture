import 'package:flutter/material.dart';
import 'package:whatsapp_clone_clean/presentation/pages/sub_pages/single_item_chat_user_page.dart';
import 'package:whatsapp_clone_clean/presentation/widgets/theme/style.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(Icons.message,color: Colors.white.withOpacity(0.6),size:40),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Start chat with your friends and family,\n on Whatsapp Clone',
                style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.4)),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (){},
        child: Icon(Icons.chat,color: Colors.white,),
      ),
    );
  }

  Widget _myChatList(){
    Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (_,index){
                return SingleItemChatUserPage();
              }
            )
          );
  }

}