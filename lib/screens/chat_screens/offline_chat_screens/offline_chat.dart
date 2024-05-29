import 'package:chatterbox/providers/offline_chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfflineChat extends StatefulWidget {
  const OfflineChat({super.key});

  @override
  State<OfflineChat> createState() => _OfflineChatState();
}

class _OfflineChatState extends State<OfflineChat> {
  final TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OfflineChatProvider(),
      child: Consumer<OfflineChatProvider>(
        builder: (context, offchatprovider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Chat with AI',
                style: GoogleFonts.urbanist(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.folder_open),
                  onPressed: () {
                    OfflineChatProvider.pickAndSelectGGUFFile(
                        context.read<OfflineChatProvider>());
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                if (OfflineChatProvider.filePath != null)
                  Expanded(
                    child: ListView.builder(
                      itemCount: offchatprovider.messages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(offchatprovider.messages[index]),
                        );
                      },
                    ),
                  ),
                if (OfflineChatProvider.filePath != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: promptController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your message',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            OfflineChatProvider.sendMessageToAI(
                              promptController.text,
                              context.read<OfflineChatProvider>(),
                            );
                            promptController.clear();
                          },
                          child: const Text('Send'),
                        ),
                      ],
                    ),
                  ),
                if (OfflineChatProvider.filePath == null)
                  const Expanded(
                    child: Center(
                      child: Text('Please select a .gguf file'),
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
