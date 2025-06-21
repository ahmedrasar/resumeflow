enum GeminiModelsEnum {
  g2Flash('Gemini 2 Flash', 'gemini-2.0-flash'),
  g2FlashLite('Gemini 2 Flash Lite', 'gemini-2.0-flash-lite');

  final String name;
  final String modelCode;
  const GeminiModelsEnum(this.name, this.modelCode);
}
