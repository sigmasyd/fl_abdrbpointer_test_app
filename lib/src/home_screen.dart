import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAbsorving = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(absorbing: isAbsorving, child: _HomeBody()),
      floatingActionButton: FloatingActionButton(
        child: Icon(this.isAbsorving ? Icons.lock : Icons.lock_open),
        onPressed: () {
          setState((){
            this.isAbsorving = !this.isAbsorving;
          });
        },
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _CustomOutlinedButton(width: double.infinity),
            Row(
              children: [
                _CustomOutlinedButton(width: 200),
                Expanded(child: _CustomOutlinedButton()),
              ],
            ),
            Row(
              children: [
                Expanded(child: _CustomOutlinedButton()),
                _CustomOutlinedButton(width: 200),
              ],
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: ListView.builder(
                  itemBuilder: (_, i) => ListTile(title: Text('${i + 1}'))),
            ))
          ],
        ),
      ),
    );
  }
}

class _CustomOutlinedButton extends StatelessWidget {
  final double width;
  final double height;

  const _CustomOutlinedButton({
    Key key,
    this.width = 150,
    this.height = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: this.width,
        height: this.height,
        child: OutlinedButton(onPressed: () {}, child: Text('Button')));
  }
}
