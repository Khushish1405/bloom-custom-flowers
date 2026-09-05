import 'package:flutter/material.dart';
import '../../data/flowers.dart';
import '../../theme/app_theme.dart';
import '../../utils/whatsapp_helper.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  // State Variables
  final Map<String, int> _selectedFlowers = {};
  String _selectedWrapping = 'Classic Paper';
  final List<String> _selectedExtras = [];
  
  final _messageController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Options Data
  final Map<String, double> _wrappingOptions = {
    'Classic Paper': 50,
    'Kraft Paper': 80,
    'Premium Wrapper': 100,
    'Luxury Box': 250,
  };

  final Map<String, double> _extraOptions = {
    'Greeting Card': 50,
    'Silk Ribbon': 30,
    'Ferrero Rocher Box': 200,
    'Small Teddy Bear': 350,
  };

  @override
  void dispose() {
    _messageController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  double _calculateTotal() {
    double total = 0;
    
    // Flowers
    _selectedFlowers.forEach((flowerId, qty) {
      final flower = allFlowers.firstWhere((f) => f.id == flowerId);
      total += flower.pricePerUnit * qty;
    });

    // Wrapping
    total += _wrappingOptions[_selectedWrapping] ?? 0;

    // Extras
    for (final extra in _selectedExtras) {
      total += _extraOptions[extra] ?? 0;
    }

    return total;
  }

  void _submitOrder() {
    if (_selectedFlowers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one flower.')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      // Build flower names map
      final Map<String, int> orderedFlowers = {};
      _selectedFlowers.forEach((id, qty) {
        final f = allFlowers.firstWhere((fl) => fl.id == id);
        orderedFlowers[f.name] = qty;
      });

      final message = WhatsAppHelper.generateOrderMessage(
        flowers: orderedFlowers,
        wrapping: _selectedWrapping,
        extras: _selectedExtras,
        personalMessage: _messageController.text,
        customerName: _nameController.text,
        phone: _phoneController.text,
        deliveryDate: _dateController.text,
        deliveryAddress: _addressController.text,
        estimatedPrice: _calculateTotal(),
      );

      WhatsAppHelper.sendMessage(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal();
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: AppTheme.backgroundCream,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionTitle('1. Choose Your Flowers'),
                        _buildFlowersGrid(),
                        const SizedBox(height: 48),
                        
                        _buildSectionTitle('2. Wrapping Style'),
                        _buildWrappingOptions(),
                        const SizedBox(height: 48),
                        
                        _buildSectionTitle('3. Extras (Optional)'),
                        _buildExtraOptions(),
                        const SizedBox(height: 48),
                        
                        _buildSectionTitle('4. Delivery Details'),
                        _buildDeliveryForm(isDesktop),
                        const SizedBox(height: 120), // Space for bottom bar
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomStickyBar(total),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentBlush.withValues(alpha: 0.3),
            AppTheme.backgroundCream,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Build Your Bouquet',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Handpick every detail and let us craft it for you.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppTheme.primaryRose,
          fontFamily: 'Playfair Display',
        ),
      ),
    );
  }

  Widget _buildFlowersGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: allFlowers.length,
      itemBuilder: (context, index) {
        final f = allFlowers[index];
        final qty = _selectedFlowers[f.id] ?? 0;
        final bool isSelected = qty > 0;
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppTheme.primaryRose : AppTheme.dividerColor.withValues(alpha: 0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_florist, size: 40, color: AppTheme.primaryRose),
              const SizedBox(height: 8),
              Text(
                f.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                '₹${f.pricePerUnit.toStringAsFixed(0)} / ${f.unit}',
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    color: AppTheme.textSecondary,
                    onPressed: () {
                      if (qty > 0) {
                        setState(() {
                          if (qty == 1) {
                            _selectedFlowers.remove(f.id);
                          } else {
                            _selectedFlowers[f.id] = qty - 1;
                          }
                        });
                      }
                    },
                  ),
                  Text(
                    '$qty',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    color: AppTheme.primaryRose,
                    onPressed: () {
                      setState(() {
                        _selectedFlowers[f.id] = qty + 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWrappingOptions() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _wrappingOptions.entries.map((e) {
        final isSelected = _selectedWrapping == e.key;
        return ChoiceChip(
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${e.key} (+₹${e.value.toStringAsFixed(0)})'),
          ),
          selected: isSelected,
          selectedColor: AppTheme.primaryRose,
          backgroundColor: Colors.white,
          side: BorderSide(color: isSelected ? AppTheme.primaryRose : AppTheme.dividerColor),
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          onSelected: (bool selected) {
            if (selected) {
              setState(() {
                _selectedWrapping = e.key;
              });
            }
          },
        );
      }).toList(),
    );
  }

  Widget _buildExtraOptions() {
    return Column(
      children: _extraOptions.entries.map((e) {
        final isSelected = _selectedExtras.contains(e.key);
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.dividerColor.withValues(alpha: 0.5)),
          ),
          child: CheckboxListTile(
            title: Text(e.key, style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('+₹${e.value.toStringAsFixed(0)}'),
            value: isSelected,
            activeColor: AppTheme.primaryRose,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onChanged: (bool? checked) {
              setState(() {
                if (checked == true) {
                  _selectedExtras.add(e.key);
                } else {
                  _selectedExtras.remove(e.key);
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryRose,
              onPrimary: Colors.white,
              onSurface: AppTheme.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        // Format as DD/MM/YYYY
        _dateController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  Widget _buildDeliveryForm(bool isDesktop) {
    return Column(
      children: [
        if (isDesktop)
          Row(
            children: [
              Expanded(child: _buildTextField(_nameController, 'Your Name', Icons.person)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_phoneController, 'Phone Number', Icons.phone, isPhone: true)),
            ],
          )
        else ...[
          _buildTextField(_nameController, 'Your Name', Icons.person),
          const SizedBox(height: 16),
          _buildTextField(_phoneController, 'Phone Number', Icons.phone, isPhone: true),
        ],
        const SizedBox(height: 16),
        _buildTextField(
          _dateController, 
          'Delivery Date', 
          Icons.calendar_today,
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
        const SizedBox(height: 16),
        _buildTextField(_addressController, 'Delivery Address', Icons.location_on, maxLines: 2),
        const SizedBox(height: 16),
        _buildTextField(_messageController, 'Personal Card Message (Optional)', Icons.edit, maxLines: 2, isRequired: false),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    int maxLines = 1,
    bool isPhone = false,
    bool isRequired = true,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: isPhone ? 10 : null,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      readOnly: readOnly,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        counterText: '', // Hide the 0/10 counter
        prefixIcon: Icon(icon, color: AppTheme.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.dividerColor.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryRose),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: isRequired
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (isPhone && value.length < 10) {
                return 'Please enter a valid 10-digit phone number';
              }
              return null;
            }
          : null,
    );
  }

  Widget _buildBottomStickyBar(double total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Estimated Total', style: TextStyle(color: AppTheme.textSecondary)),
                Text(
                  '₹${total.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryRose,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: _submitOrder,
              icon: const Icon(Icons.send, size: 20),
              label: const Text('Order on WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.whatsappGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
