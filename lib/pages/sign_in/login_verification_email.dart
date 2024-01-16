import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/widget/widgets.dart';

import '../app.dart';

class Verification1 extends StatefulWidget {
  const Verification1({Key? key, required this.a1}) : super(key: key);
  final String a1;

  @override
  State<Verification1> createState() => _Verification1State();
}

class _Verification1State extends State<Verification1> {
  List data = Get.arguments;
  final TextEditingController controller = TextEditingController();
  final FocusNode _pinputfocusNode = FocusNode();
  late QueryVerifySend _queryVerifySend;
  late VerifySend _verifyData;
  late QueryLoginCaptcha _queryLoginCaptcha;
  late LoginCaptcha _loginCaptcha;
  var phoneNumber = '1';
  final verifyCode = '1';

  late Timer _timer;
  late String _numbers;

  //倒计时数值
  var _enable = true;
  var _time = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _numbers = "+${data[1]}-${data[0]}";
    });
    _loadVerifySend1(data[0], data[1]);
    _enable ? startCountdown1(60) : null;
  }

  @override
  void dispose() {
    controller.dispose();
    _pinputfocusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  ///获取验证码
  /// [_mobile]为用户输入手机号码
  /// [_area] 为用户所选国家区号
  _loadVerifySend1(String _mobile, int _area) async {
    _queryVerifySend = await GqlUserAPI.verifySend(
        context: context,
        variables: VerifySendRequest(
          mobile: _mobile,
          area: _area,
        ));
    setState(
      () {
        _verifyData = _queryVerifySend.verifySend;
        if (kDebugMode) {
          print('发送验证码');
        }
      },
    );
    if (_verifyData.status == '100') {
    } else {
      debugPrint("发送失败");
      toastInfo(msg: '获取验证码失败，请用其他方式登录！');
    }
  }

  ///验证码登陆
  /// [_mobile]为用户输入手机号码
  /// [_area] 为用户所选国家区号
  /// [_code]为验证码
  _loadLoginCaptcha1(String _mobile, int _area, String _code) async {
    _queryLoginCaptcha = await GqlUserAPI.loginCaptcha(
        context: context,
        variables: LoginCaptchaRequest(
          mobile: _mobile,
          area: _area,
          code: _code,
        ));
    setState(
      () {
        _loginCaptcha = _queryLoginCaptcha.loginCaptcha;
        if (kDebugMode) {
          print('验证码验证');
        }
      },
    );
    if (_loginCaptcha.status == '100') {
      Get.offAll(const App());
    } else {
      debugPrint("发送失败");
      toastInfo(msg: '获取验证码失败，请用其他方式登录！');
    }
  }

  //倒计时方法
  void startCountdown1(int count) {
    if (!_enable) return;
    setState(() {
      _enable = false;
      _time = count;
    });
    //倒计时时间
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer it) {
      if (kDebugMode) {
        print(it.tick);
      }
      setState(() {
        if (it.tick == count) {
          _enable = true;
          it.cancel();
        }
        _time = count - it.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _pinputfocusNode.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true, // Extend the body behind the app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(
                left: 16.0), // Adjust the left padding as needed
            child: IconButton(
              icon: Transform.scale(
                scale: 1.0,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),

        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: 1.sh,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/DLLC.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200.h),
                Row(children: [
                  Transform.translate(
                    offset: const Offset(20, -10), // 文字向上移动10逻辑像素
                    child: const Text(
                      "输入邮箱验证码",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "MyFontStyle", //所用的字体、这里用的是自定义的字体
                        color: Colors.black, // 字体颜色
                        fontSize: 28,
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 30.h),
                Transform.translate(
                  offset: const Offset(22, -5),
                  child: Text(
                    "请输入发送至" +
                        // data[1].toString() +
                        data[0].substring(0, 4) +
                        "****" +
                        data[0].substring(data[0].length - 4) +
                        "的6位验证码,\n有效期10分钟",
                    style: const TextStyle(
                      fontFamily: "MyFontStyle",
                      fontSize: 19,
                      color: PFc.textSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Pinput(
                    length: 6,
                    controller: controller,
                    focusNode: _pinputfocusNode,
                    autofocus: true,
                    showCursor: true,
                    cursor: cursor1,
                    separator: Container(
                      height: 2.5.h,
                      width: 1.sw - 2 * 360.w,
                      decoration:
                          const BoxDecoration(color: PFc.backgroundBlack),
                    ),
                    separatorPositions: const [3],
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    defaultPinTheme: defaultPinTheme1,
                    submittedPinTheme: submittedPinTheme1,
                    focusedPinTheme: defaultPinTheme1.copyWith(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: PFc.themeColor),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: PFc.themeColor,
                        //     offset: Offset(0, 3),
                        //     blurRadius: 10,
                        //   )
                        // ],
                      ),
                    ),
                    onCompleted: (value) {
                      String code = value.toString();
                      _loadLoginCaptcha1(data[0], data[1], code);
                    },
                  ),
                ),
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {
                    _enable ? startCountdown1(60) : null;
                    _loadVerifySend1(data[0], data[1]);
                  },
                  child: Transform.translate(
                    offset: const Offset(22, -5),
                    child: Text(
                      _time == 0 ? "重新获取验证码" : "${_time}s后可重新获取验证码",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: "MyFontStyle",
                        color: _time == 0 ? PFc.themeColor : PFc.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final defaultPinTheme1 = PinTheme(
    width: 0.12.sw, // Change the width to make the squares smaller
    height: 0.12.sw,
    textStyle: const TextStyle(
      fontFamily: "MyFontStyle",
      fontSize: 24,
    ), // Change the height to make the squares smaller
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: PFc.textSecondary),
    ),
  );

  final submittedPinTheme1 = PinTheme(
    width: 0.12.sw, // Change the width to make the squares smaller
    height: 0.12.sw, // Change the height to make the squares smaller
    textStyle: const TextStyle(
        color: PFc.textPrimary, fontSize: 24, fontFamily: "MyFontStyle"),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: PFc.themeColor),
    ),
  );

  //光标
  final cursor1 = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: PFc.themeColor,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
