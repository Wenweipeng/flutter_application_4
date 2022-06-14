import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ListTile(
            title: Text('SizedBoxTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SizedBoxTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('RowColumnTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RowColumnTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('SpecialTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SpecialTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('SpecialTest02'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SpecialTest02(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('FlexTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlexTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('WrapTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WrapTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('FlowTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlowTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('StackTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('StackTest2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackTest2(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('AlignTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AlignTest(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SizedBoxTest extends StatefulWidget {
  const SizedBoxTest({Key? key}) : super(key: key);

  @override
  State<SizedBoxTest> createState() => _SizedBoxTestState();
}

class _SizedBoxTestState extends State<SizedBoxTest> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SizedBox"),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: Container(
                  height: 5.0,
                  child: redBox,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: redBox,
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: redBox,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                    child: UnconstrainedBox(
                      //“去除”父级限制
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                        child: redBox,
                      ),
                    ))),
          ],
        ));
  }
}

class RowColumnTest extends StatefulWidget {
  const RowColumnTest({Key? key}) : super(key: key);

  @override
  State<RowColumnTest> createState() => _RowColumnTestState();
}

class _RowColumnTestState extends State<RowColumnTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowColumn"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(
                      " hello world ",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(" I am Jack "),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialTest extends StatefulWidget {
  const SpecialTest({Key? key}) : super(key: key);

  @override
  State<SpecialTest> createState() => _SpecialTestState();
}

class _SpecialTestState extends State<SpecialTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test02"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialTest02 extends StatefulWidget {
  const SpecialTest02({Key? key}) : super(key: key);

  @override
  State<SpecialTest02> createState() => _SpecialTest02State();
}

class _SpecialTest02State extends State<SpecialTest02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test03"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                    children: <Widget>[
                      Text("hello world "),
                      Text("I am Jack "),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlexTest extends StatefulWidget {
  const FlexTest({Key? key}) : super(key: key);

  @override
  State<FlexTest> createState() => _FlexTestState();
}

class _FlexTestState extends State<FlexTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex"),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WrapTest extends StatefulWidget {
  const WrapTest({Key? key}) : super(key: key);

  @override
  State<WrapTest> createState() => _WrapTestState();
}

class _WrapTestState extends State<WrapTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wrap"),
      ),
      body: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children: [
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class FlowTest extends StatefulWidget {
  const FlowTest({Key? key}) : super(key: key);

  @override
  State<FlowTest> createState() => _FlowTestState();
}

class _FlowTestState extends State<FlowTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flow"),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.red,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.blue,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.yellow,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.brown,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class StackTest extends StatefulWidget {
  const StackTest({Key? key}) : super(key: key);

  @override
  State<StackTest> createState() => _StackTestState();
}

class _StackTestState extends State<StackTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Container(
        child: //通过ConstrainedBox来确保Stack占满屏幕
            ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StackTest2 extends StatefulWidget {
  const StackTest2({Key? key}) : super(key: key);

  @override
  State<StackTest2> createState() => _StackTest2State();
}

class _StackTest2State extends State<StackTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

class AlignTest extends StatefulWidget {
  const AlignTest({Key? key}) : super(key: key);

  @override
  State<AlignTest> createState() => _AlignTestState();
}

class _AlignTestState extends State<AlignTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Align"),
        ),
        body: Column(children: [
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue.shade50,
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue.shade50,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          SizedBox(height: 20),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          )
        ]));
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(children: children, mainAxisSize: MainAxisSize.min);
        } else {
          // 大于200，显示双列
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(children: _children, mainAxisSize: MainAxisSize.min);
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
        ResponsiveColumn(children: _children),
        LayoutLogPrint(child: Text("xx")) // 下面介绍
      ],
    );
  }
} 

// class AfterLayoutRoute extends StatefulWidget {
//   const AfterLayoutRoute({Key? key}) : super(key: key);

//   @override
//   _AfterLayoutRouteState createState() => _AfterLayoutRouteState();
// }

// class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
//   String _text = 'flutter 实战 ';
//   Size _size = Size.zero;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Builder(
//             builder: (context) {
//               return GestureDetector(
//                 child: Text(
//                   'Text1: 点我获取我的大小',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 onTap: () => print('Text1: ${context.size}'),
//               );
//             },
//           ),
//         ),
//         AfterLayout(
//           callback: (RenderAfterLayout ral) {
//             print('Text2： ${ral.size}, ${ral.offset}');
//           },
//           child: Text('Text2：flutter@wendux'),
//         ),
//         Builder(builder: (context) {
//           return Container(
//             color: Colors.grey.shade200,
//             alignment: Alignment.center,
//             width: 100,
//             height: 100,
//             child: AfterLayout(
//               callback: (RenderAfterLayout ral) {
//                 Offset offset = ral.localToGlobal(
//                   Offset.zero,
//                   ancestor: context.findRenderObject(),
//                 );
//                 print('A 在 Container 中占用的空间范围为：${offset & ral.size}');
//               },
//               child: Text('A'),
//             ),
//           );
//         }),
//         Divider(),
//         AfterLayout(
//           child: Text(_text), 
//           callback: (RenderAfterLayout value) {
//             setState(() {
//               //更新尺寸信息
//               _size = value.size;
//             });
//           },
//         ),
//         //显示上面 Text 的尺寸
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Text(
//             'Text size: $_size ',
//             style: TextStyle(color: Colors.blue),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _text += 'flutter 实战 ';
//             });
//           },
//           child: Text('追加字符串'),
//         ),
//       ],
//     );
//   }
// }

