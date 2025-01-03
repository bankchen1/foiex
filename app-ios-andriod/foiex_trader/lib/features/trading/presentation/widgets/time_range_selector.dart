import 'package:flutter/material.dart';

class TimeRange {
  final String label;
  final DateTime startTime;
  final DateTime endTime;

  const TimeRange({
    required this.label,
    required this.startTime,
    required this.endTime,
  });
}

class TimeRangeSelector extends StatelessWidget {
  final TimeRange selectedRange;
  final Function(TimeRange) onRangeChanged;

  static final List<TimeRange> predefinedRanges = [
    TimeRange(
      label: '7天',
      startTime: DateTime.now().subtract(const Duration(days: 7)),
      endTime: DateTime.now(),
    ),
    TimeRange(
      label: '30天',
      startTime: DateTime.now().subtract(const Duration(days: 30)),
      endTime: DateTime.now(),
    ),
    TimeRange(
      label: '90天',
      startTime: DateTime.now().subtract(const Duration(days: 90)),
      endTime: DateTime.now(),
    ),
    TimeRange(
      label: '半年',
      startTime: DateTime.now().subtract(const Duration(days: 180)),
      endTime: DateTime.now(),
    ),
    TimeRange(
      label: '1年',
      startTime: DateTime.now().subtract(const Duration(days: 365)),
      endTime: DateTime.now(),
    ),
  ];

  const TimeRangeSelector({
    Key? key,
    required this.selectedRange,
    required this.onRangeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '时间范围',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...predefinedRanges.map((range) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(range.label),
                      selected: selectedRange.label == range.label,
                      onSelected: (selected) {
                        if (selected) {
                          onRangeChanged(range);
                        }
                      },
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ActionChip(
                  label: const Text('自定义'),
                  onPressed: () => _showDateRangePicker(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showDateRangePicker(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: selectedRange.startTime,
      end: selectedRange.endTime,
    );

    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: initialDateRange,
    );

    if (pickedRange != null) {
      onRangeChanged(TimeRange(
        label: '自定义',
        startTime: pickedRange.start,
        endTime: pickedRange.end,
      ));
    }
  }
}
