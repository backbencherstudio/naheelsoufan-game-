class ApiEndPoints{
  // BASE URL
  static const String baseUrl = "https://cognitively-undecaying-azalee.ngrok-free.dev";


  static const String registerUrl = "$baseUrl/api/auth/register";
  static const String loginUrl = "$baseUrl/api/auth/login";

  static const String fetchUserDataUrl = "$baseUrl/api/auth/me";
}