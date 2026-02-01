import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlightShimmerLoading extends StatelessWidget {
  const FlightShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // Show 5 skeleton cards
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // TOP ROW: Logo and Date
                Row(
                  children: [
                    Container(width: 80, height: 20, color: Colors.white),
                    const SizedBox(width: 6),
                    const CircleAvatar(radius: 16, backgroundColor: Colors.white),
                    const Spacer(),
                    Container(width: 60, height: 12, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                // MIDDLE: Flight Path
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 50, height: 24, color: Colors.white),
                        const SizedBox(height: 4),
                        Container(width: 70, height: 12, color: Colors.white),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(width: 50, height: 24, color: Colors.white),
                        const SizedBox(height: 4),
                        Container(width: 70, height: 12, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // SEAT & PRICE
                Row(
                  children: [
                    const CircleAvatar(radius: 10, backgroundColor: Colors.white),
                    const SizedBox(width: 8),
                    Container(width: 60, height: 14, color: Colors.white),
                    const Spacer(),
                    Container(width: 80, height: 20, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                // BUTTON
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}