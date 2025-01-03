import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/market_provider.dart';
import '../../data/models/market_models.dart';

class MarketDetailScreen extends StatefulWidget {
  final String symbol;

  const MarketDetailScreen({Key? key, required this.symbol}) : super(key: key);

  @override
  _MarketDetailScreenState createState() => _MarketDetailScreenState();
}

class _MarketDetailScreenState extends State<MarketDetailScreen> {
  String _selectedInterval = '1h';
  final List<String> _intervals = ['1m', '5m', '15m', '1h', '4h', '1d'];

  @override
  void initState() {
    super.initState();
    final marketProvider = context.read<MarketProvider>();
    marketProvider.loadKlines(widget.symbol, _selectedInterval);
    marketProvider.loadDepth(widget.symbol);
    marketProvider.subscribeToTicker(widget.symbol);
  }

  @override
  void dispose() {
    context.read<MarketProvider>().unsubscribeFromTicker(widget.symbol);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.symbol),
      ),
      body: Consumer<MarketProvider>(
        builder: (context, marketProvider, child) {
          final ticker = marketProvider.tickers
              .firstWhere((t) => t.symbol == widget.symbol);
          final klines = marketProvider.getKlines(widget.symbol);
          final depth = marketProvider.getDepth(widget.symbol);

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildPriceHeader(ticker),
                _buildIntervalSelector(),
                if (klines != null) _buildKlineChart(klines),
                if (depth != null) _buildDepthSection(depth),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPriceHeader(MarketTicker ticker) {
    final isPositive = ticker.priceChangePercent >= 0;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticker.lastPrice.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${isPositive ? '+' : ''}${ticker.priceChangePercent.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('24h High: ${ticker.high24h.toStringAsFixed(2)}'),
              Text('24h Low: ${ticker.low24h.toStringAsFixed(2)}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIntervalSelector() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _intervals.length,
        itemBuilder: (context, index) {
          final interval = _intervals[index];
          final isSelected = interval == _selectedInterval;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(interval),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedInterval = interval;
                  });
                  context
                      .read<MarketProvider>()
                      .loadKlines(widget.symbol, interval);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildKlineChart(List<Kline> klines) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: klines.asMap().entries.map((entry) {
                return FlSpot(
                  entry.key.toDouble(),
                  entry.value.close,
                );
              }).toList(),
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepthSection(MarketDepth depth) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Book',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildDepthList('Bids', depth.bids, Colors.green),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDepthList('Asks', depth.asks, Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDepthList(String title, List<List<double>> items, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...items.take(5).map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item[0].toStringAsFixed(2)),
                Text(item[1].toStringAsFixed(2)),
              ],
            ),
          );
        }),
      ],
    );
  }
}
