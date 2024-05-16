import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreditCardPage(),
    );
  }
}

class CreditCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreditCardWidget(),
      ),
    );
  }
}

class CreditCardWidget extends StatefulWidget {
  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  bool isFront = true;

  void _flipCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: Container(
          key: ValueKey<bool>(isFront),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Color(0xFF2F3336), Color(0XFF4DB6AC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0)
              ),
            ],
          ),
          child: isFront
            ? _buildFrontContent()
            : _buildBackContent(),
        ),
      ),
    );
  }

  Widget _buildFrontContent() {
    return Padding(
        padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.network(
                  'https://mtf.mastercard.co.za/content/dam/public/mastercardcom/mea/za/logos/mc-logo-52.svg',
                width: 25,
                height: 25,
              ),
              Text(
                '**** **** **** 1234',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'TITULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                'NOME DO TITULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'VALIDADE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '12/26',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBackContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                    child: Container(
                      color: Color(0xFF2F3336),
                      height: 50,
                    ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              'CVV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 4,),
            Container(
              color: Colors.white,
              height: 30,
              width: 100,
              child: Center(
                child: Text(
                  '123',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}