import 'package:flutter/material.dart';
import 'service_provider.dart';
import 'profession.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _providerType = 'Any';
  String? _selectedProfession;
  ServiceProvider? _selectedProvider;

  void updateProviderType(String? type) {
    setState(() {
      _providerType = type ?? 'Any';
      _selectedProvider = null;
    });
  }

  void updateProfession(String profession) {
    setState(() {
      _selectedProfession = profession;
      _selectedProvider = null;
    });
  }

  void updateProvider(ServiceProvider provider) {
    setState(() {
      _selectedProvider = provider;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<ServiceProvider> filteredProviders = providers.where((provider) {
      bool matchesType = _providerType == 'Any' ||
          (_providerType == 'Individual' && provider.isIndividual) ||
          (_providerType == 'Company' && !provider.isIndividual);
      bool matchesProfession =
          _selectedProfession == null || provider.profession == _selectedProfession;

      return matchesType && matchesProfession;
    }).toList();


    print("Filtered Providers: ${filteredProviders.map((p) => p.name).toList()}");


    if (!filteredProviders.contains(_selectedProvider)) {
      _selectedProvider = filteredProviders.isNotEmpty ? filteredProviders.first : null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service provider'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Individual',
                  groupValue: _providerType,
                  onChanged: updateProviderType,
                ),
                const Text('Individual'),
                Radio<String>(
                  value: 'Company',
                  groupValue: _providerType,
                  onChanged: updateProviderType,
                ),
                const Text('Company'),
                Radio<String>(
                  value: 'Any',
                  groupValue: _providerType,
                  onChanged: updateProviderType,
                ),
                const Text('Any'),
              ],
            ),
            ProfessionWidget(updateProfession: updateProfession),
            const SizedBox(height: 10.0),
            filteredProviders.isNotEmpty
                ? ProviderWidget(
              filteredProviders: filteredProviders,
              selectedProvider: _selectedProvider,
              updateProvider: updateProvider,
            )
                : const Text('No providers found for the selected criteria.'),
            const SizedBox(height: 10.0),
            if (_selectedProvider != null)
              Column(
                children: [
                  Text(_selectedProvider.toString()),
                ],
              ),

          ],
        ),
      ),
    );
  }
}

class ProviderWidget extends StatelessWidget {
  final List<ServiceProvider> filteredProviders;
  final ServiceProvider? selectedProvider;
  final Function(ServiceProvider) updateProvider;

  const ProviderWidget({
    required this.filteredProviders,
    required this.selectedProvider,
    required this.updateProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ServiceProvider>(
      value: selectedProvider,
      items: filteredProviders.map((provider) {
        return DropdownMenuItem<ServiceProvider>(
          value: provider,
          child: Text(provider.name),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          updateProvider(value);
        }
      },

    );
  }
}