import 'package:flutter/material.dart';
import 'package:tugas2/utils/formatting.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regisEmailController = TextEditingController();
  TextEditingController regisPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isObscure = true;
  final bool _isnotObscure = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: hexToColor('12731C'),
          ),
          child: Center(
            child: Container(
              height: 550,
              width: 365,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                          color: hexToColor('12731C'),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'Login',
                          ),
                          Tab(
                            text: 'Register',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hexToColor('12731C'),
                                    ),
                                  ),
                                  hintText: 'Enter Email',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: hexToColor('12731C'),
                                      ),
                                    ),
                                    hintText: 'Enter Password',
                                    suffixIcon: IconButton(
                                      color: Colors.grey,
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )),
                                obscureText:
                                    _isObscure ? _isObscure : _isnotObscure,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: hexToColor('12731C'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  ),
                                ),
                                onPressed: () {},
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: regisEmailController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hexToColor('12731C'),
                                    ),
                                  ),
                                  hintText: 'Enter Email',
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: regisPasswordController,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: hexToColor('12731C'),
                                      ),
                                    ),
                                    hintText: 'Enter Password',
                                    suffixIcon: IconButton(
                                      color: Colors.grey,
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )),
                                obscureText:
                                    _isObscure ? _isObscure : _isnotObscure,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: hexToColor('12731C'),
                                      ),
                                    ),
                                    hintText: 'Enter Confirm Password',
                                    suffixIcon: IconButton(
                                      color: Colors.grey,
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )),
                                obscureText:
                                    _isObscure ? _isObscure : _isnotObscure,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: hexToColor('12731C'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  ),
                                ),
                                onPressed: () {},
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
