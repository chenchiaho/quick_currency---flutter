import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String _amount = '';
  String _selectedCurrencyFrom = 'USD'; // Default "From" currency set to USD
  String _selectedCurrencyTo = 'USD'; // Default "To" currency set to USD
  String _conversionResult = '';

  // Sample currency list
  final List<String> _currencyList = ['USD', 'EUR', 'JPY', 'GBP'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Currency Converter",
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _amount = value;
                  });
                },
              ),
              SizedBox(height: 16),
              // Dropdown for 'From' currency
              _buildDropdown("From", _selectedCurrencyFrom, (String? newValue) {
                setState(() {
                  _selectedCurrencyFrom = newValue!;
                });
              }),
              SizedBox(height: 16),
              // Dropdown for 'To' currency
              _buildDropdown("To", _selectedCurrencyTo, (String? newValue) {
                setState(() {
                  _selectedCurrencyTo = newValue!;
                });
              }),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),
              SizedBox(height: 16),
              Text(_conversionResult,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, String value, ValueChanged<String?> onChanged) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          onChanged: onChanged,
          items: _currencyList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _convertCurrency() {
    // Placeholder for conversion logic
    setState(() {
      _conversionResult = "Conversion result will be displayed here";
    });
  }
}
