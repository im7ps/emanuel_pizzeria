import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  // Coordinate esatte della pizzeria
  static const LatLng _pizzeriaLocation = LatLng(38.071914, 15.658033);

  Future<void> _openExternalMaps() async {
    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=${_pizzeriaLocation.latitude},${_pizzeriaLocation.longitude}");

    try {
      if (await canLaunchUrl(googleMapsUrl)) {
        await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("Errore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal:
              BorderSide(color: AppTheme.gold.withValues(alpha: 0.3), width: 1),
        ),
      ),
      child: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: _pizzeriaLocation,
              initialZoom: 16.5,
              interactionOptions: InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.emanuel_pizzeria.app',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: _pizzeriaLocation,
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton.small(
              backgroundColor: Colors.white,
              elevation: 4,
              onPressed: _openExternalMaps,
              child: const Icon(Icons.open_in_new,
                  color: AppTheme.accent, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
