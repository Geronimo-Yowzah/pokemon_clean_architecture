import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class _BarChart extends StatelessWidget {
  _BarChart();

  final dataList = [
    const _BarData(Colors.red, 14),
    const _BarData(Colors.blue, 15),
    const _BarData(Colors.orange, 10),
    const _BarData(Colors.grey, 12),
    const _BarData(Colors.green, 13),
    // const _BarData(AppColors.contentColorRed, 10, 15),
  ];

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double toY,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: toY,
          color: color,
          width: 25,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: dataList.asMap().entries.map((e) {
          final index = e.key;
          final data = e.value;
          return generateBarGroup(
            index,
            data.colors,
            data.toY,
          );
        }).toList(),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = [
      'Thai',
      'Japanese',
      'Chinese',
      'American',
      'Rusian',
      'test'
    ];
    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
      border: const Border(
          top: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide(width: 1),
          bottom: BorderSide(width: 1)));

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.black,
          Colors.red,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

// List<BarChartGroupData> get barGroups => [
// BarChartGroupData(
//   x: 0,
//   barRods: [
//     BarChartRodData(
//       fromY: 0,
//       toY: 8,
//       width: 25,
//       color: Colors.red,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 1,
//   barRods: [
//     BarChartRodData(
//       fromY: 0.3,
//       toY: 10,
//       width: 25,
//       color: Colors.blue,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 2,
//   barRods: [
//     BarChartRodData(
//       fromY: 0.3,
//       toY: 14,
//       width: 25,
//       color: Colors.orange,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 3,
//   barRods: [
//     BarChartRodData(
//       fromY: 0.3,
//       toY: 15,
//       width: 25,
//       color: Colors.grey,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 4,
//   barRods: [
//     BarChartRodData(
//       fromY: 0.3,
//       toY: 13,
//       width: 25,
//       color: Colors.green,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 5,
//   barRods: [
//     BarChartRodData(
//       fromY: 0.3,
//       toY: 10,
//       width: 25,
//       gradient: _barsGradient,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// BarChartGroupData(
//   x: 6,
//   barRods: [
//     BarChartRodData(
//       toY: 16,
//       gradient: _barsGradient,
//     )
//   ],
//   showingTooltipIndicators: [0],
// ),
// ];
}

class BarChartPage extends StatefulWidget {
  const BarChartPage({super.key, required this.title});

  final String title;

  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(
                child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )),
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                context.go('/');
              },
            )),
        body: AspectRatio(
          aspectRatio: 1.2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: _BarChart(),
          ),
        )
        // BarChart(BarChartData(
        //     borderData: FlBorderData(
        //         border: const Border(
        //             top: BorderSide.none,
        //             right: BorderSide.none,
        //             left: BorderSide(width: 1),
        //             bottom: BorderSide(width: 1))),
        //     barGroups: [
        //       BarChartGroupData(
        //         x: 1,
        //         barRods: [
        //           BarChartRodData(
        //             fromY: 0,
        //             toY: 10,
        //             width: 10,
        //             color: Colors.red
        //           )
        //         ]
        //       )
        //     ]))
        );
  }
}

class _BarData {
  const _BarData(this.colors, this.toY);

  final Color colors;
  final double toY;
}
