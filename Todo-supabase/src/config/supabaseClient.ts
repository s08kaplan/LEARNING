import { createClient } from "@supabase/supabase-js";

const supabaseURL = import.meta.env.VITE_BASE_URL
const supabaseKEY = import.meta.env.VITE_ANON_KEY
const supabase = createClient(supabaseURL, supabaseKEY)

export default supabase