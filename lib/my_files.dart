import 'package:flutter/material.dart';
import 'package:test/responsive.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Files", style: Theme.of(context).textTheme.subtitle1),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add"),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            )
          ],
        ),
        SizedBox(height: 20),
        Responsive(
          desktop: FileInfoGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          mobile: FileInfoGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoGridView(),
        )
      ],
    );
  }
}

class FileInfoGridView extends StatelessWidget {
  const FileInfoGridView({
    Key key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => FileInfoCard(
        icon: icons[index],
        color: colors[index],
        document: documents[index],
        width: widths[index],
      ),
    );
  }
}

List<IconData> icons = [
  Icons.file_present,
  Icons.file_present_outlined,
  Icons.file_upload,
  Icons.filter
];
List<Color> colors = [
  Colors.lightBlue,
  Colors.orangeAccent,
  Colors.green,
  Colors.pink[400]
];
List<String> documents = [
  "Documents",
  "Google Drive",
  "Downloads",
  "One Drive",
];
List<double> widths=[
0.7,0.5,0.6,0.9
];

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({Key key, this.icon, this.color, this.document, this.width})
      : super(key: key);
  final IconData icon;
  final Color color;
  final String document;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left:10),
                child: IconButton(
                  icon: Icon(icon),
                  color: color,
                  onPressed: () {},
                ),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left:10),
            child: Text(
              document,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              LayoutBuilder(
                  builder: (context, constraints) => Container(
                        width: constraints.maxWidth * width,
                        height: 5,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ))
            ],
          )
        ],
      ),
    );
  }
}
