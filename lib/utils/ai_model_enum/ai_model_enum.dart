import 'package:resumeflow/models/gen_ai_service_interfaces/gen_ai_service_interface.dart';
import 'package:resumeflow/services/client_gen_ai/client_gen_ai.dart';
import 'package:resumeflow/services/server_gen_ai/server_gen_ai.dart';

enum AiGenServiceEnum {
  clientSide(ClientGenAi()),
  serverSide(ServerGenAi());

  final GenAiServiceInterface aiGenService;
  const AiGenServiceEnum(this.aiGenService);
}
