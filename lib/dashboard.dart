import 'package:flutter/material.dart';
import 'package:test/head.dart';
import 'package:test/responsive.dart';
import 'package:test/storage_line.dart';
import 'package:test/test.dart';

import 'my_files.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Head(),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: 15),
                        RecentFiles(),
                        if(Responsive.isMobile(context))
                        SizedBox(height:20),
                        if (Responsive.isMobile(context))
                        StorageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                  SizedBox(
                    width: 20,
                  ),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: StorageDetails(),
                    )
                ],
              )
            ],
          )),
    );
  }
}

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 600,
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: Test(),
          ),
          StorageLine(name:"Documents Files",count:52,size: "1GB",icon:Icons.document_scanner_sharp),
          StorageLine(name:"Media Files",count:34,size: "1.34GB",icon: Icons.picture_in_picture_sharp,),
          StorageLine(name:"Other Files",count:38,size: "2.75GB",icon:Icons.other_houses_rounded),
          StorageLine(name:"Unknown",count:25,size: "0.74GB",icon:Icons.warning_rounded),
        ],
      ),
    );
  }
}

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(horizontalMargin:0,
            columnSpacing: 20,
            columns: [
              DataColumn(
                  label: Text(
                "File Name",
              )),
              DataColumn(
                  label: Text(
                "Date",
              )),
              DataColumn(
                  label: Text(
                "Size",
              )),
            ], rows: [
              DataRow(cells: [
                DataCell(Row(
                  children: [
                    Icon(Icons.document_scanner,color: Colors.red,),
                    SizedBox(width:20),
                    Text("Documents")
                  ],
                )),
                DataCell(Text("01/02/21")),
                DataCell(Text("1.2GB")),
              ]),
              DataRow(cells: [
                DataCell(Row(
                  children: [
                    Icon(Icons.media_bluetooth_on,color: Colors.blue,),
                    SizedBox(width:20),
                    Text("Sound")
                  ],
                )),
                DataCell(Text("01/02/21")),
                DataCell(Text("1GB")),
              ]),
              DataRow(cells: [
                DataCell(Row(
                  children: [
                    Icon(Icons.picture_as_pdf,color: Colors.redAccent,),
                    SizedBox(width:20),
                    Text("Pdf Files")
                  ],
                )),
                DataCell(Text("01/01/21")),
                DataCell(Text("1.1GB")),
              ]),
                            DataRow(cells: [
                DataCell(Row(
                  children: [
                    Icon(Icons.picture_as_pdf,color: Colors.pinkAccent,),
                    SizedBox(width:20),
                    Text("XD File")
                  ],
                )),
                DataCell(Text("01/03/21")),
                DataCell(Text("2GB")),
              ]),
            ]),
          )
        ],
      ),
    );
  }
}
