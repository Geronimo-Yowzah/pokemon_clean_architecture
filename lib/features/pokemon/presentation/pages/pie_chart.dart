import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartSample extends StatelessWidget {
  PieChartSample({super.key});

  final dataList = [
    const _PieData(Colors.red, 22, 'Lost', 120),
    const _PieData(Colors.green, 11, 'GSA', 120),
    const _PieData(Colors.blue, 21, 'MA', 120),
    const _PieData(Colors.orange, 45, 'Found', 120),
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 0,
        sections: getSections(),
      ),
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

class PieChartPage extends StatefulWidget {
  const PieChartPage({super.key, required this.title});

  final String title;

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
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
        body: Center(child: PieChartSample()));
  }
}

class _PieData {
  const _PieData(this.colors, this.value, this.title, this.radius);

  final Color colors;
  final double value;
  final String title;
  final double radius;
}
