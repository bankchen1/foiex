import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/follow_models.dart';
import '../../data/models/strategy_models.dart';
import '../providers/follow_provider.dart';

class FollowStrategyScreen extends StatefulWidget {
  final Strategy strategy;

  const FollowStrategyScreen({Key? key, required this.strategy})
      : super(key: key);

  @override
  _FollowStrategyScreenState createState() => _FollowStrategyScreenState();
}

class _FollowStrategyScreenState extends State<FollowStrategyScreen> {
  final _formKey = GlobalKey<FormState>();
  double _allocation = 1000;
  double _maxLoss = 10;
  double _positionRatio = 100;
  String? _note;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow Strategy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStrategyInfo(),
              const SizedBox(height: 24),
              _buildAllocationSection(),
              const SizedBox(height: 24),
              _buildRiskControlSection(),
              const SizedBox(height: 24),
              _buildNoteSection(),
              const SizedBox(height: 32),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStrategyInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.strategy.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Total Return: ${widget.strategy.totalReturn.toStringAsFixed(2)}%',
              style: TextStyle(
                color: widget.strategy.totalReturn >= 0
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Monthly Return: ${widget.strategy.monthlyReturn.toStringAsFixed(2)}%',
            ),
            const SizedBox(height: 4),
            Text(
              'Max Drawdown: ${widget.strategy.maxDrawdown.toStringAsFixed(2)}%',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Investment Amount',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: _allocation.toString(),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Amount',
            prefixText: '\$',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an amount';
            }
            final amount = double.tryParse(value);
            if (amount == null || amount <= 0) {
              return 'Please enter a valid amount';
            }
            return null;
          },
          onSaved: (value) {
            _allocation = double.parse(value!);
          },
        ),
      ],
    );
  }

  Widget _buildRiskControlSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Risk Control',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        _buildSlider(
          label: 'Max Loss',
          value: _maxLoss,
          min: 5,
          max: 50,
          divisions: 45,
          suffix: '%',
          onChanged: (value) {
            setState(() {
              _maxLoss = value;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildSlider(
          label: 'Position Ratio',
          value: _positionRatio,
          min: 10,
          max: 100,
          divisions: 90,
          suffix: '%',
          onChanged: (value) {
            setState(() {
              _positionRatio = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String suffix,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('${value.toStringAsFixed(1)}$suffix'),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: '${value.toStringAsFixed(1)}$suffix',
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Note',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Add a note (optional)',
            border: OutlineInputBorder(),
          ),
          onSaved: (value) {
            _note = value;
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _submitForm,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: _isSubmitting
            ? const CircularProgressIndicator()
            : const Text('Confirm Follow'),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    setState(() {
      _isSubmitting = true;
    });

    try {
      final request = FollowRequest(
        strategyId: widget.strategy.id,
        allocation: _allocation,
        maxLoss: _maxLoss,
        positionRatio: _positionRatio,
        note: _note,
      );

      await context.read<FollowProvider>().followStrategy(request);
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully followed strategy'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to follow strategy: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}
