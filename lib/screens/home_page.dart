import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                color: Colors.black87,
                size: 20,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.message,
                color: Colors.black87,
                size: 20,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Create post section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF1877F2),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "What's on your mind?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Stories section
            Container(
              height: 200,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 6,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildAddStoryCard();
                  }
                  return _buildStoryCard(index);
                },
              ),
            ),
            const SizedBox(height: 10),
            // News feed posts
            _buildPost(
              name: 'John Doe',
              time: '2h',
              content: 'Beautiful sunset today! 🌅',
              likes: 120,
              comments: 15,
              shares: 5,
            ),
            const SizedBox(height: 10),
            _buildPost(
              name: 'Jane Smith',
              time: '5h',
              content: 'Just finished reading an amazing book! 📚',
              likes: 89,
              comments: 12,
              shares: 3,
            ),
            const SizedBox(height: 10),
            _buildPost(
              name: 'Mike Johnson',
              time: '1d',
              content: 'New project launched! Excited to share it with everyone.',
              likes: 234,
              comments: 45,
              shares: 18,
            ),
            const SizedBox(height: 10),
            _buildPost(
              name: 'Sarah Williams',
              time: '2d',
              content: 'Coffee and coding ☕💻',
              likes: 156,
              comments: 23,
              shares: 7,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1877F2),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }

  Widget _buildAddStoryCard() {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              height: 150,
              color: Colors.grey[200],
              child: const Icon(
                Icons.add_photo_alternate,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: const Text(
                'Create Story',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCard(int index) {
    final colors = [
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.green,
    ];
    
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors[index % colors.length],
            colors[index % colors.length].withOpacity(0.7),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1877F2), width: 3),
                color: Colors.white,
              ),
              child: const Icon(Icons.person, color: Color(0xFF1877F2)),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              'User $index',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String name,
    required String time,
    required String content,
    required int likes,
    required int comments,
    required int shares,
  }) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF1877F2),
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.public, size: 12, color: Colors.grey[600]),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.grey[600]),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Post content
          Text(
            content,
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),
          const SizedBox(height: 12),
          // Post image placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 50,
                color: Colors.grey[500],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Post stats
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF1877F2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '$likes',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                '$comments comments',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$shares shares',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          // Post actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.thumb_up_outlined, 'Like', Colors.grey),
              _buildActionButton(Icons.comment_outlined, 'Comment', Colors.grey),
              _buildActionButton(Icons.share_outlined, 'Share', Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color, size: 20),
      label: Text(
        label,
        style: TextStyle(color: color, fontSize: 14),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}

