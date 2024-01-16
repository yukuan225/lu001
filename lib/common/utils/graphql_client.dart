// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../global/global.dart';
import '../services/services.dart';
import '../widget/widgets.dart';

class GraphqlClientUtil {
  static client() {
    final _httpLink = HttpLink("${Api.oracleUrl} /graphql");

    if (Global.token == '0') {
      return GraphQLClient(
        cache: GraphQLCache(),
        link: _httpLink,
      );
    } else {
      final AuthLink _authLink = AuthLink(
        getToken: () => 'Bearer ${Global.token}',
      );
      final Link _link = _authLink.concat(_httpLink);
      return GraphQLClient(
        cache: GraphQLCache(),
        link: _link,
      );
    }
  }

  // 查询
  static Future query({
    required BuildContext? context,
    required String schema,
    required Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      document: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().query(options);
    if (result.isLoading) {
      debugPrint("正在加载");
      print("1");
      //return const Center(child: CircularProgressIndicator());
    } else if (result.data == null) {
      debugPrint("没有数据");
      print("2");
      //return const Center(child: Text('Countries not found. /n找不到国家列表'));
    } else if (result.hasException) {
      toastInfo(msg: '数据请求错误');
      debugPrint(result.exception.toString());
      print("3");
      //throw result.exception;
    } else {
      print("4");
    }

    return result;
  }

  // 操作
  static Future mutate({
    required BuildContext context,
    required String schema,
    required Map<String, dynamic> variables,
  }) async {
    MutationOptions options = MutationOptions(
      document: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().mutate(options);
    if (result.hasException) {
      if (kDebugMode) {
        print(
          result.exception.toString(),
        );
      }
      //toastInfo(msg: result.exception.toString());
      //throw result.exception;
    }
    return result;
  }

  //   /// 错误处理
  // static _formatException(BuildContext context, OperationException exception) {
  //   var statusCode = '';
  //   try {
  //     statusCode = exception
  //         .graphqlErrors[0]?.extensions["exception"]["output"]["statusCode"]
  //         .toString();
  //     if (statusCode == '') {
  //       statusCode = exception.graphqlErrors[0]?.extensions["exception"]["code"]
  //           .toString();
  //     }
  //   } catch (e) {}

  //   switch (statusCode) {
  //     case '400': // 重新登录
  //       toastInfo(msg: "错误请求，提交数据错误！");
  //       break;
  //     case '401': // 没有认证
  //     case '403': // 没有授权
  //       toastInfo(msg: "账号无效、服务没有授权，请重新登录！");
  //       return goLoginPage(context);
  //     // break;
  //     default:
  //       toastInfo(msg: exception.toString());
  //   }
  //   throw exception;
  // }
}
