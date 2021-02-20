import 'package:flutter/material.dart';
import 'package:pictionary/game_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  WelcomeScreen({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static String id = 'WelcomeScreen';
  TextEditingController _textEditingController;
  List<String> players = [];


  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  Widget _buildPlayerNames(BuildContext context, int index) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              players[index] ?? 'No players found',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  players.removeAt(index);
                });
              },
              child: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Pictionary',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 14, top: 18.0),
                      child: Text(
                        "Players",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 6,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 5.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        _buildPlayerNames,
                        childCount: players.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Enter the names',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 22.0,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: TextField(
                          controller: _textEditingController,
                          autofocus: true,
                          onSubmitted: (String value) {
                            setState(() {
                              players.add(value);

                              _textEditingController.clear();
                            });

                            print(players);
                          },
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Player Name',
                            hintStyle: TextStyle(fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.teal,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return GameScreen(
                              players: players,
                            );
                          }
                        ),);
                      },
                      child: Text(
                        'Play',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
