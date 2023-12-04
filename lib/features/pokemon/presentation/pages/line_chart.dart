import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  LineChartSample({super.key});

  final dataList = [
    const _PieData(Colors.red, 22, 'Lost', 120),
    const _PieData(Colors.green, 11, 'GSA', 120),
    const _PieData(Colors.blue, 21, 'MA', 120),
    const _PieData(Colors.orange, 45, 'Found', 120),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 0),
                FlSpot(2, 2),
                FlSpot(4, 1),
                FlSpot(6, 4),
                FlSpot(7, 5),
                FlSpot(10, 3),
                FlSpot(11, 7),
              ],
              dotData: FlDotData(show: true),
              color: Colors.orange,
              barWidth: 5
            ),
            LineChartBarData(
                spots: const [
                  FlSpot(0, 0),
                  FlSpot(1, 0.5),
                  FlSpot(2, 4),
                  FlSpot(5, 4),
                  FlSpot(7, 5),
                  FlSpot(10, 1),
                  FlSpot(11, 5),
                ],
                dotData: FlDotData(show: true),
                color: Colors.lightBlue,
                barWidth: 5
            )

          ]
        )
      )
    );
  }

  List<PieChartSectionData> getSections() {
    return dataList.map((data) {
      return PieChartSectionData(
        color: data.colors,
        value: data.value,
        title: data.title,
        badgeWidget: Text(
          data.value.toInt().toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        radius: data.radius,
        titlePositionPercentageOffset: 0.7,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}

class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key, required this.title});

  final String title;

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
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
        body: Center(child: LineChartSample()));
  }
}

class _PieData {
  const _PieData(this.colors, this.value, this.title, this.radius);

  final Color colors;
  final double value;
  final String title;
  final double radius;
}
