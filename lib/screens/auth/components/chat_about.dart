import 'package:flutter/widgets.dart';
import 'package:my_chat_app/res/app_constants.dart';

class ChatAbout extends StatelessWidget {
  const ChatAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: Column(
              children: const [
                Text(
                  "lets start chat",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Poppins",
                    height: 1.2,
                    color: AppConstants.primeryColor,
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  "Everyone was exceptionally friendly as hundreds of bicyclists wandered about, chatting and smiling, with a hint of nervous excitement in their voices.",
                  style: TextStyle(
                    color: AppConstants.primeryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
