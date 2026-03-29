import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/app_data.dart';
import '../../widgets/common_widgets.dart';

class MeasurementFormScreen extends StatefulWidget {
  final Design design;
  const MeasurementFormScreen({super.key, required this.design});

  @override
  State<MeasurementFormScreen> createState() => _MeasurementFormScreenState();
}

class _MeasurementFormScreenState extends State<MeasurementFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _chest = TextEditingController();
  final _waist = TextEditingController();
  final _hips = TextEditingController();
  final _shoulder = TextEditingController();
  final _length = TextEditingController();
  final _notes = TextEditingController();

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      AppData.orders.add(Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        design: widget.design,
        customerName: _name.text,
        status: 'Pending',
        placedAt: DateTime.now(),
        measurements: Measurements(
          chest: _chest.text,
          waist: _waist.text,
          hips: _hips.text,
          shoulder: _shoulder.text,
          length: _length.text,
          notes: _notes.text,
        ),
      ));

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
          backgroundColor: AppColors.cardDark,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.emerald.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_circle,
                      color: AppColors.emeraldLight, size: 40),
                ),
                const SizedBox(height: 16),
                const Text('Order Placed!',
                    style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 22,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text(
                  'Your order for "${widget.design.title}" is confirmed. The tailor will contact you soon.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 24),
                GoldButton(
                  label: 'Back to Home',
                  icon: Icons.home,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        title: const Text('Your Measurements'),
        backgroundColor: AppColors.royalIndigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Order summary card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3A2A0A), Color(0xFF2A1A00)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.gold.withOpacity(0.3), width: 1),
              ),
              child: Row(
                children: [
                  Text(widget.design.emoji,
                      style: const TextStyle(fontSize: 32)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.design.title,
                            style: const TextStyle(
                                color: AppColors.textLight,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                        Text(widget.design.tailorName,
                            style: const TextStyle(
                                color: AppColors.textMuted, fontSize: 12)),
                      ],
                    ),
                  ),
                  Text(
                    '₹${widget.design.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _sectionLabel('Your Details'),
            _Field(
                controller: _name,
                label: 'Full Name',
                hint: 'e.g. Priya Sharma',
                icon: Icons.person_outline),

            const SizedBox(height: 20),
            _sectionLabel('Body Measurements (in inches)'),
            _Field(
                controller: _chest,
                label: 'Chest / Bust',
                hint: 'e.g. 36',
                icon: Icons.straighten,
                isNumber: true),
            const SizedBox(height: 12),
            _Field(
                controller: _waist,
                label: 'Waist',
                hint: 'e.g. 30',
                icon: Icons.straighten,
                isNumber: true),
            const SizedBox(height: 12),
            _Field(
                controller: _hips,
                label: 'Hips',
                hint: 'e.g. 38',
                icon: Icons.straighten,
                isNumber: true),
            const SizedBox(height: 12),
            _Field(
                controller: _shoulder,
                label: 'Shoulder Width',
                hint: 'e.g. 14',
                icon: Icons.width_normal,
                isNumber: true),
            const SizedBox(height: 12),
            _Field(
                controller: _length,
                label: 'Length',
                hint: 'e.g. 42',
                icon: Icons.height,
                isNumber: true),

            const SizedBox(height: 20),
            _sectionLabel('Special Instructions (Optional)'),
            TextFormField(
              controller: _notes,
              maxLines: 3,
              style: const TextStyle(color: AppColors.textLight),
              decoration: const InputDecoration(
                hintText: 'e.g. Add pockets, prefer loose fit...',
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 32),
            GoldButton(
              label:
              'Place Order — ₹${widget.design.price.toStringAsFixed(0)}',
              icon: Icons.check_circle_outline,
              onTap: _placeOrder,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(text,
        style: const TextStyle(
            color: AppColors.gold,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1)),
  );
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool isNumber;

  const _Field({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:
      isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: AppColors.textLight),
      validator: (v) =>
      (v == null || v.trim().isEmpty) ? '$label is required' : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.gold, size: 20),
      ),
    );
  }
}
