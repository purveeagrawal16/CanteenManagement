import 'package:flutter/material.dart';

//new feedback form
class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double _overallRating = 0;
  int? _foundItemsEasily;
  double _satisfactionWithVariety = 0;
  int? _visuallyAppealing;
  int? _helpfulDescriptions;
  double _navigationEase = 0;
  int? _orderIssues;
  double _satisfactionWithDeliveryTime = 0;
  int? _foodDeliveredAsExpected;
  double _likelihoodToRecommend = 0;
  TextEditingController _suggestionController = TextEditingController();

  @override
  void dispose() {
    _suggestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Canteen Feedback Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Were you able to find the food items you were looking for easily?',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('Yes', style: TextStyle(fontSize: 20)),
                    value: 10,
                    groupValue: _orderIssues,
                    onChanged: (value) {
                      setState(() {
                        _orderIssues = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('No', style: TextStyle(fontSize: 20)),
                    value: 11,
                    groupValue: _orderIssues,
                    onChanged: (value) {
                      setState(() {
                        _orderIssues = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'May be',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 12,
                    groupValue: _orderIssues,
                    onChanged: (value) {
                      setState(() {
                        _orderIssues = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            Text('Did you find the app\'s interface visually appealing?',
                style: TextStyle(fontSize: 20)),
            Row(
              // vairable used _visuallyAppealing
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 3,
                    groupValue: _visuallyAppealing,
                    onChanged: (value) {
                      setState(() {
                        _visuallyAppealing = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 4,
                    groupValue: _visuallyAppealing,
                    onChanged: (value) {
                      setState(() {
                        _visuallyAppealing = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'May be',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 5,
                    groupValue: _visuallyAppealing,
                    onChanged: (value) {
                      setState(() {
                        _visuallyAppealing = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
                'Were the food item descriptions and images helpful in making your selections?',
                style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('Yes', style: TextStyle(fontSize: 20)),
                    value: 7,
                    groupValue: _helpfulDescriptions,
                    onChanged: (value) {
                      setState(() {
                        _helpfulDescriptions = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('No', style: TextStyle(fontSize: 20)),
                    value: 8,
                    groupValue: _helpfulDescriptions,
                    onChanged: (value) {
                      setState(() {
                        _helpfulDescriptions = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'May be',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 9,
                    groupValue: _helpfulDescriptions,
                    onChanged: (value) {
                      setState(() {
                        _helpfulDescriptions = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            Text('Did you encounter any issues while placing your order?',
                style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('Yes', style: TextStyle(fontSize: 20)),
                    value: 1,
                    groupValue: _foundItemsEasily,
                    onChanged: (value) {
                      setState(() {
                        _foundItemsEasily = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('No', style: TextStyle(fontSize: 20)),
                    value: 0,
                    groupValue: _foundItemsEasily,
                    onChanged: (value) {
                      setState(() {
                        _foundItemsEasily = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'May be',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 2,
                    groupValue: _foundItemsEasily,
                    onChanged: (value) {
                      setState(() {
                        _foundItemsEasily = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            Text('Were the food items delivered as expected?',
                style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('Yes', style: TextStyle(fontSize: 20)),
                    value: 13,
                    groupValue: _foodDeliveredAsExpected,
                    onChanged: (value) {
                      setState(() {
                        _foodDeliveredAsExpected = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text('No', style: TextStyle(fontSize: 20)),
                    value: 14,
                    groupValue: _foodDeliveredAsExpected,
                    onChanged: (value) {
                      setState(() {
                        _foodDeliveredAsExpected = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    title: Text(
                      'May be',
                      style: TextStyle(fontSize: 20),
                    ),
                    value: 15,
                    groupValue: _foodDeliveredAsExpected,
                    onChanged: (value) {
                      setState(() {
                        _foodDeliveredAsExpected = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            Text('How satisfied were you with the delivery time?',
                style: TextStyle(fontSize: 20)),
            Slider(
              value: _satisfactionWithDeliveryTime,
              onChanged: (value) {
                setState(() {
                  _satisfactionWithDeliveryTime = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: '$_satisfactionWithDeliveryTime',
            ),
            Divider(),
            Text(
                'How satisfied were you with the variety of food items available?',
                style: TextStyle(fontSize: 20)),
            Slider(
              value: _satisfactionWithVariety,
              onChanged: (value) {
                setState(() {
                  _satisfactionWithVariety = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: '$_satisfactionWithVariety',
            ),
            Divider(),
            Text(
                'How likely are you to recommend the app to a friend or colleague?',
                style: TextStyle(fontSize: 20)),
            Slider(
              value: _likelihoodToRecommend,
              onChanged: (value) {
                setState(() {
                  _likelihoodToRecommend = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: '$_likelihoodToRecommend',
            ),
            Divider(),
            Text(
              'How would you rate the overall user experience of the app?',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: _overallRating,
              onChanged: (value) {
                setState(() {
                  _overallRating = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: '$_overallRating',
            ),
            Divider(),
            Text(
              'Any comments, questions, or suggestions?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _suggestionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Write here..',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the feedback
                print(
                  'Feedback submitted',
                );
                print('Suggestions: ${_suggestionController.text}');
              },
              child: Text('Submit', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
