import 'package:flutter/material.dart';
import 'package:test/responsive.dart';
import 'package:provider/provider.dart';
import 'providers/control2.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: context.read<Menu>().controlMenu,
            icon: Icon(Icons.menu),
          ),
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6,
        ),
        if(!Responsive.isMobile(context))Spacer(),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              suffixIcon: Container(
                padding: EdgeInsets.all(20 * 0.75),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Icon(Icons.search),
              ),
            ),
          ),
        )
      ],
    );
  }
}
