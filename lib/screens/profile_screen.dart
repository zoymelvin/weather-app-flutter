import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildProfileHeader(),

              const SizedBox(height: 24),
              _buildStatCard(),

              const SizedBox(height: 30),
              _buildSectionHeader("Akun Seting"),
              
              const SizedBox(height: 10),
              _buildMenuItem(
                icon: Icons.person,
                title: "Informasi Pribadi",
                subtitle: "Nama, email, dan nomor",
                onTap: () {}, 
              ),
              const SizedBox(height: 12),
              _buildMenuItem(
                icon: Icons.security,
                title: "keamanan",
                subtitle: "Kata sandi dan keamanan akun",
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("App Seting"),
              
              const SizedBox(height: 10),
              _buildMenuItem(
                icon: Icons.thermostat,
                title: "Satuan Suhu",
                subtitle: "Atur satuan suhu",
                trailingText: "°C",
                onTap : (){},
              ),

              const SizedBox(height: 12),
              _buildMenuItem(
                icon: Icons.language,
                title: "Bahasa",
                subtitle: "Pilih bahasa aplikasi",
                trailingText: "Bahasa Indonesia",
                onTap: (){},
              ),

              const SizedBox(height: 12),
              _buildMenuItem(
                icon: Icons.dark_mode,
                title: "Tema Aplikasi",
                subtitle: "Mode Gelap/Terang",
                trailingText: "Gelap",
                onTap: (){},
              ),

              const SizedBox(height: 24),
              _buildSectionHeader("Lainnya"),

              const SizedBox(height: 10),
              _buildMenuItem(
                icon: Icons.help_outline,
                title: "Batuan",
                subtitle: "Bantuan dan pusat dukungan",
                onTap: (){},
              ),

              const SizedBox(height: 12),
              _buildMenuItem(
                icon: Icons.description,
                title: "Kebijakan Privasi",
                subtitle: "Kebijakan privasi aplikasi",
                onTap: (){},
              ),

              const SizedBox(height: 40),

              TextButton(
                onPressed: () {},
                
                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
              ),

              const Text(
                "Weather App · v1.0.0",
                style:  TextStyle(
                  color: AppColors.kTextSub,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(){
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1e293b),
            border:  Border.all(color: AppColors.kCardBlueSolid.withOpacity(0.2), width: 2),          
          ),
          child: const Center(
            child: Text(
              "JM",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.kTextSub
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          "Joy Melvin Ginting",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.kTextMain,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          "zoymelvin@gmail.com",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.kTextSub,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 36,
          child: OutlinedButton.icon(
            onPressed: (){},
            icon: const Icon(Icons.edit, size: 16, color: AppColors.kTextMain),
            label: const Text(
              "Edit Profil",
              style: TextStyle(color: AppColors.kTextMain, fontSize: 13),
            ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.kTextSub.withOpacity(0.3)),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
        ),
      ],
    );
  }

  Widget _buildStatCard(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0f172a),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem("Kota Disimpan","5"),
          _buildDivider(),
          _buildStatItem("satuan Favorit", "Celsius"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.kTextSub),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.kTextMain,
          ),
        ),
      ],
    );
  }


  Widget _buildDivider(){
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.1),
    );
  }

  Widget _buildSectionHeader(String title){
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: AppColors.kTextSub.withOpacity(0.7),
        ),
      ),
    );
  }
  

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return Material(
      color: const Color.fromARGB(0, 68, 66, 66),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color (0xFF0f172a),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF1e293b),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.kCardBlueSolid, size: 22),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kTextMain,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.kTextSub.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ],
                )
              ),

              if(trailingText != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  trailingText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.kTextSub,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              )
            ],
          ),
        ),
      ),
    ); 
  }

}