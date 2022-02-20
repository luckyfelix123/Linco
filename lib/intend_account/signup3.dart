import 'package:flutter/material.dart';

import 'finalsignup.dart';

class Signup3 extends StatefulWidget {
  const Signup3({Key key}) : super(key: key);

  @override
  _Signup3State createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(143, 50, 49, 1),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("asset/flsh.jpeg"),
                radius: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('CREATE YOUR ACCCOUNT (3/4)',
              style: TextStyle(
                  color: Color.fromRGBO(211, 167, 167, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Container(),
          Container(
            width: 300,
            // height: 50,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(176, 108, 108, 1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Pasword:',
                // isCollapsed: true,
                border: InputBorder.none,

                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Signup3(),
                  //   ),
                  // );

                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Color.fromRGBO(143, 50, 49, 1),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 90,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("asset/flsh.jpeg"),
                                    radius: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text('ONE MORE STEP TO GO (4/4)',
                                  style: TextStyle(
                                      color: Color.fromRGBO(211, 167, 167, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),

                              const SizedBox(
                                height: 30,
                              ),

                              // const  SizedBox(
                              //     height: 10,
                              //   ),
                              Container(
                                width: 300,
                                // height: 50,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(176, 108, 108, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Re-type your pasword:',
                                    // isCollapsed: true,
                                    border: InputBorder.none,

                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => FinalSignup(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: const Text(
                                        'NEXT',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FinalSignup(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Text(
                      'NEXT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
