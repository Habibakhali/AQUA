import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
String title;
String routeName;
AccountSetting(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return
 Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, routeName);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
