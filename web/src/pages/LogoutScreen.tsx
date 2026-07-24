import React from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, LogOut } from 'lucide-react'
import { motion } from 'framer-motion'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'
import { supabase } from '../lib/supabaseClient'

export function LogoutScreen() {
  const navigate = useNavigate()
  return <AnimatedPage className="tv-page px-6 pb-8 pt-8"><button onClick={() => navigate(-1)} className="tv-muted flex items-center gap-2 text-sm font-semibold"><ArrowLeft size={19} /> Go back</button><div className="flex flex-1 flex-col items-center justify-center text-center"><motion.div initial={{ scale: 0.85, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} transition={{ type: 'spring', stiffness: 220, damping: 18 }} className="flex h-24 w-24 items-center justify-center rounded-[2rem] border border-orange-200 bg-orange-50"><LogOut size={42} className="text-[#FF7A00]" /></motion.div><BrandLogo compact className="mt-7 w-16" /><h1 className="tv-text mt-6 text-2xl font-bold">Log out?</h1><p className="tv-muted mt-2 max-w-[265px] text-sm leading-6">You’ll need to sign in again to manage your service requests.</p><div className="mt-10 w-full space-y-3"><button onClick={async () => { await supabase.auth.signOut(); navigate('/login'); }} className="w-full rounded-2xl bg-[#0A1F44] py-4 font-semibold text-white shadow-lg shadow-blue-950/20 active:scale-[0.98]">Yes, log out</button><button onClick={() => navigate(-1)} className="tv-surface tv-text w-full rounded-2xl border tv-border py-4 font-semibold active:scale-[0.98]">Cancel</button></div></div></AnimatedPage>
}
