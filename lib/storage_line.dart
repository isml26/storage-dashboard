import 'package:flutter/material.dart';

class StorageLine extends StatelessWidget {
  IconData icon;
  final String name;
  final int count;
  final String size;
  StorageLine({this.name,this.count,this.size,this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Icon(icon),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "$count files",
                style: TextStyle(fontSize: 12),
              ),
            ],
          )),
          Text(size),
        ],
      ),
    );
  }
}
