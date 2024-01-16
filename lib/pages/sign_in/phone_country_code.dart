import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lab/common/widget/text_widget.dart';

import '../../common/entitys/data_userlogin_phone.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';

import '../../controller/signin_controller.dart';
import 'contrast.dart';

//选择城市地区联动索引页
//https://raw.githubusercontent.com/xiedong11/flutter_app/master/static/phoneCode.json

class PhoneCountryCodePage extends StatefulWidget {
  const PhoneCountryCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<PhoneCountryCodePage> {
  final SigninController c = Get.find();

  List<String> letters = [];

  List<ListDatum> datums = [];

  List<ListDatum> result = [];

  late Phoneresponse fdata;
  late List<Datum> data = [];

  double _top = 100;

  bool _float = false;

  bool _search = true;

  final ScrollController _scrollController = ScrollController();

  final TextEditingController _searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPhoneCodeDataList();
  }

  @override
  void dispose() {
    super.dispose();
    _searchcontroller.dispose();
    _scrollController.dispose();
  }

  getPhoneCodeDataList() async {
    String jsonString =
        await rootBundle.loadString("assets/static/phoneCode.json");

    fdata = Phoneresponse.fromJson(json.decode(jsonString));

    if (fdata.code == 200) {
      setState(() {
        data = fdata.data;
        for (int i = 0; i < data.length; i++) {
          letters.add(data[i].name.toUpperCase());
        }

        for (int i = 0; i < data.length; i++) {
          for (int j = 0; j < data[i].listData.length; j++) {
            datums.add(data[i].listData[j]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true, // 标题居中
        title: PFtext.text3(
          text: "选择国家和地区",
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 10, right: 20, left: 20),
            child: Container(
              height: 38,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(230, 230, 230, 1.0),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                autofocus: false,
                controller: _searchcontroller,
                keyboardType: TextInputType.text,
                //textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: PFc.themeColor,
                  ),
                  hintText: "搜索",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xff434343),
                      fontFamily: "MyFontStyle"),
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  border: InputBorder.none,
                ),
                maxLines: 1,
                autocorrect: false,
                onChanged: (value) {
                  setState(() {
                    value;
                    result.clear();
                    _search = true;
                    for (int i = 0; i < datums.length; i++) {
                      if (PFcontrast.client(value, datums[i].name)) {
                        result.add(datums[i]);
                      }
                    }
                    if (result.isEmpty && value.isNotEmpty) {
                      _search = false;
                    }
                  });
                  if (kDebugMode) {
                    print("你输入的内容为$value");
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          result.isEmpty
              ? _search == true
                  ? ListView.builder(
                      controller: _scrollController,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            PhoneCodeIndexName(data[index].name.toUpperCase()),
                            ListView.separated(
                              itemCount: data[index].listData.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index2) {
                                return GestureDetector(
                                  child: Container(
                                    color: Colors.white,
                                    height: 46,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: PFspace.screenMargin),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                              data[index].listData[index2].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff434343),
                                                  fontFamily: "MyFontStyle")),
                                          Text(
                                            "   +${data[index].listData[index2].code}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff434343),
                                                fontFamily: "MyFontStyle"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    c.increment(int.parse(
                                        data[index].listData[index2].code));
                                    Get.back();
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 0,
                                  color: Colors.grey,
                                  indent: PFspace.screenMargin,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    )
                  : const SizedBox(
                      child: Center(
                        child: Text("没有找到这个国家或地区哦！"),
                      ),
                    )
              : ListView.separated(
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index3) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.white,
                        height: 46,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: PFspace.screenMargin),
                          child: Row(
                            children: <Widget>[
                              Text(result[index3].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff434343),
                                      fontFamily: "MyFontStyle")),
                              Text(
                                "   +${result[index3].code}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff434343),
                                    fontFamily: "MyFontStyle"),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        c.increment(int.parse(result[index3].code));
                        Get.back();
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0,
                      color: Colors.grey,
                      indent: PFspace.screenMargin,
                    );
                  },
                ),
          result.isEmpty && _search == true
              ? Align(
                  alignment: const FractionalOffset(1.0, 0.5),
                  child: GestureDetector(
                    onVerticalDragStart: (details) {
                      if (kDebugMode) {
                        print(
                            "onVerticalDragStart---${details.localPosition.dy}");
                      }
                      setState(() {
                        _high(details.localPosition.dy);
                        _float = true;
                      });
                    },
                    onVerticalDragCancel: () {
                      if (kDebugMode) {
                        print("onVerticalDragCancel");
                      }
                    },
                    onVerticalDragDown: (details) {
                      if (kDebugMode) {
                        print(
                            "onVerticalDragDown---${details.localPosition.dy}");
                      }
                      setState(() {
                        _high(details.localPosition.dy);
                        _float = false;
                      });
                    },
                    onVerticalDragEnd: (details) {
                      if (kDebugMode) {
                        print(
                            "onVerticalDragEnd---${details.velocity}---${details.primaryVelocity}");
                      }
                      setState(() {
                        _float = false;
                      });
                    },
                    onVerticalDragUpdate: (details) {
                      if (kDebugMode) {
                        print(
                            "onVerticalDragUpdate----${details.localPosition.dy}");
                      }
                      setState(() {
                        _high(details.localPosition.dy);
                      });
                    },
                    child: SizedBox(
                      width: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: letters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: SizedBox(
                                height: 20,
                                child: Text(
                                  letters[index],
                                  style: index == ((_top - 100) ~/ 20) &&
                                          _float == true
                                      ? const TextStyle(
                                          color: PFc.themeColor,
                                          fontSize: 20,
                                          fontFamily: "MyFontStyle")
                                      : const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "MyFontStyle"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
              right: 50,
              top: _top,
              child: _float == true
                  ? Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.w),
                        color: PFc.themeColor,
                      ),
                      child: Center(
                        child: Text(letters.isEmpty
                            ? ""
                            : letters[((_top - 100) ~/ 20)]),
                      ),
                    )
                  : const Text("")),
        ],
      ),
    );
  }

  _high(e) {
    if (e > 100 && e < 100 + letters.length * 20) {
      _top = e;
      var a = (_top - 100) ~/ 20;
      var height = a * 45.0;
      for (int i = 0; i < a; i++) {
        height += data[i].listData.length * 46.0;
      }
      _scrollController.jumpTo(height);
    }
  }
}

class PhoneCodeIndexName extends StatelessWidget {
  final String indexName;
  const PhoneCodeIndexName(this.indexName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: PFc.backgroundBlack10,
      child: Padding(
        child: Text(indexName,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff434343),
                fontFamily: "MyFontStyle")),
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: PFspace.screenMargin),
      ),
    );
  }
}
