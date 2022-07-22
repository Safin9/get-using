import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InClass extends StatelessWidget {
  const InClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64, bottom: 34),
                  child: Container(
                    width: 159,
                    height: 159,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/236x/79/12/d8/7912d81ea3eb82efeb0b42a7cc7b88cc--pitbull-images-pitbull-rapper.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(90.0)),
                      border: Border.all(
                        color: const Color.fromRGBO(189, 255, 215, 0.9),
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'FULL NAME',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 64, top: 15, right: 64),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Nunc\n vulputate libero et velit interdum, ac aliquet odio mattis.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                myWidget(
                  text: 'LinkedIn',
                  color: const Color.fromRGBO(243, 242, 255, 1),
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  onTap: () {
                    print('LinkedIn');
                  },
                ),
                FutureBuilder(
                    future: waitfivemin(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return myWidget(
                          text: 'Github',
                          color: const Color.fromRGBO(243, 242, 255, 1),
                          icon: const FaIcon(FontAwesomeIcons.github),
                          onTap: () {
                            print('Github');
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                myWidget(
                  text: 'facebook',
                  color: const Color.fromRGBO(199, 228, 255, 1),
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  onTap: () {},
                ),
                myWidget(
                  text: 'Instagram',
                  color: const Color.fromRGBO(255, 242, 242, 1),
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  onTap: () {},
                ),
                myWidget(
                    text: 'MyWebsite',
                    color: const Color.fromRGBO(255, 251, 242, 1),
                    icon: const FaIcon(FontAwesomeIcons.firefoxBrowser),
                    onTap: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myContainer(
                        icon: Icons.call,
                        color: const Color.fromRGBO(243, 242, 255, 1),
                      ),
                      myContainer(
                        icon: Icons.mail,
                        color: const Color.fromRGBO(199, 228, 255, 1),
                      ),
                      myContainer(
                        icon: Icons.message,
                        color: const Color.fromRGBO(255, 251, 242, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  waitfivemin() async {
    return await Future.delayed(const Duration(seconds: 5), () {
      return true;
    });
  }
}

Widget myWidget(
    {required String text,
    required Color color,
    required Widget icon,
    required GestureTapCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 299,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget myContainer({required IconData icon, required Color color}) {
  return Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: color,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    width: 40,
    height: 40,
    child: Center(
      child: Icon(icon),
    ),
  );
}
