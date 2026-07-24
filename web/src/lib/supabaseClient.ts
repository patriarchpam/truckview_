import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://vedgjwndvkbgupnrjsna.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlZGdqd25kdmtiZ3VwbnJqc25hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MDI5OTYsImV4cCI6MjEwMDM3ODk5Nn0.myN98rlr02tw5DkhDcaOKOVfoiYnUv4cxkLBj3abxuA'

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
