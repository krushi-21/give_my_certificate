import 'package:supabase/supabase.dart';

import 'api_constants.dart';

class DbClient {
  static SupabaseClient supabaseClient =
      SupabaseClient(ApiConstants.BASE_URL, ApiConstants.API_KEY);
}
