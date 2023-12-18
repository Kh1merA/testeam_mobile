import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/quizzes.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/test_container.dart';
import 'package:testeam_mobile_application/pages/loading_page/loading.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

enum LoadingStatus {
  loading,
  loaded,
}

LoadingStatus _loadingStatus = LoadingStatus.loading;

class test_page extends StatefulWidget {
  const test_page({
    super.key,
  });

  @override
  State<test_page> createState() => _test_pageState();
}

class _test_pageState extends State<test_page> {
  late Quizzes quizzesInfo;
  late String userToken;
  late String companyId;

  @override
  void initState() {
    super.initState();
    userToken = '';
    quizzesInfo = Quizzes(quizzes: []);
    _initializeState();
  }

  _initializeState() async {
    await _loadToken();
    print('Token: $companyId');
    await quizzesInfo.getQuizInfoForMe(userToken, companyId);
    _loadingStatus = LoadingStatus.loaded;
    setState(() {});
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('token');
    String? companyString = prefs.getString('companyId');
    print('User String: $userString');
    if (userString != null && userString.isNotEmpty && companyString != null) {
      setState(() {
        userToken = userString;
        companyId = companyString;
      });
    }
  }
  @override
Widget build(BuildContext context) {
  if (_loadingStatus == LoadingStatus.loading) {
    return Loading();
  } else {
    return _buildQuizListWidget();
  }
}

  Widget _buildQuizListWidget() {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'List of Tests',
            style: textQuizTitlePage,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: 500,
                height: 600,
                child:
                  ListView.builder(
  itemCount: quizzesInfo.quizzes.length,
  itemBuilder: (context, index) {
    return test_container(quizInfo: quizzesInfo.quizzes[index]);
  },
  physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
)
                ),
          ),
        ],
      ),
    );
  }
}
