import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double sum;

  const PaymentItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.sum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: 216,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: Offset(0, 8),
                  blurRadius: 14)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(icon, size: 40, color: Colors.green),
                  SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                subtitle,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(height: 2),
              Text(
                '${sum.round()} ₽ в месяц',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.55)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
