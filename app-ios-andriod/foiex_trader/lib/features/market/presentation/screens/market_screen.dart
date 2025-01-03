import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/market_provider.dart';
import '../../data/models/market_models.dart';
import 'market_detail_screen.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _marketTypes = ['Forex', 'Crypto', 'Commodities', 'Indices'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _marketTypes.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MarketProvider>().loadTickers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markets'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _marketTypes.map((type) => Tab(text: type)).toList(),
        ),
      ),
      body: Consumer<MarketProvider>(
        builder: (context, marketProvider, child) {
          if (marketProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final tickers = marketProvider.tickers;

          return TabBarView(
            controller: _tabController,
            children: _marketTypes.map((type) {
              final filteredTickers = tickers
                  .where((ticker) => ticker.marketType == type.toLowerCase())
                  .toList();

              return RefreshIndicator(
                onRefresh: () => marketProvider.loadTickers(),
                child: ListView.builder(
                  itemCount: filteredTickers.length,
                  itemBuilder: (context, index) {
                    final ticker = filteredTickers[index];
                    return MarketListItem(ticker: ticker);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class MarketListItem extends StatelessWidget {
  final MarketTicker ticker;

  const MarketListItem({Key? key, required this.ticker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPositive = ticker.priceChangePercent >= 0;
    final changeColor = isPositive ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarketDetailScreen(symbol: ticker.symbol),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticker.symbol,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Vol: ${ticker.volume24h.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ticker.lastPrice.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: changeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${isPositive ? '+' : ''}${ticker.priceChangePercent.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: changeColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
