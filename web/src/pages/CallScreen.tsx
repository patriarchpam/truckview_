import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Mic, Phone, PhoneOff, Volume2 } from 'lucide-react'
import { motion } from 'framer-motion'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

export function CallScreen() {
  const navigate = useNavigate()
  const [connected, setConnected] = useState(false)
  const [seconds, setSeconds] = useState(0)
  const [muted, setMuted] = useState(false)
  const [speaker, setSpeaker] = useState(false)
  useEffect(() => { const timeout = setTimeout(() => setConnected(true), 2500); return () => clearTimeout(timeout) }, [])
  useEffect(() => { if (!connected) return; const timer = setInterval(() => setSeconds((value) => value + 1), 1000); return () => clearInterval(timer) }, [connected])
  const time = `${Math.floor(seconds / 60).toString().padStart(2, '0')}:${(seconds % 60).toString().padStart(2, '0')}`
  return <AnimatedPage className="tv-page items-center px-6 pb-10 pt-10 text-center"><BrandLogo compact className="w-16" /><div className="relative mt-auto mb-7 flex h-36 w-36 items-center justify-center">{!connected && <><motion.span className="absolute inset-0 rounded-full border-2 border-orange-300" animate={{ scale: [1, 1.5], opacity: [0.8, 0] }} transition={{ repeat: Infinity, duration: 1.7 }} /><motion.span className="absolute inset-0 rounded-full border-2 border-orange-300" animate={{ scale: [1, 1.5], opacity: [0.8, 0] }} transition={{ repeat: Infinity, duration: 1.7, delay: 0.55 }} /></>}<div className="relative flex h-28 w-28 items-center justify-center rounded-full bg-[#0A1F44] shadow-xl shadow-blue-950/25"><Phone size={39} className="text-white" /></div></div><h1 className="tv-text text-2xl font-bold">TruckView Support</h1><p className="tv-muted mt-1 text-sm">+234 555 123 4567</p><p className={`mt-3 text-sm font-semibold ${connected ? 'text-emerald-600' : 'text-[#FF7A00]'}`}>{connected ? `Connected • ${time}` : 'Connecting you to support...'}</p><div className="mt-auto flex items-center gap-7"><button onClick={() => setMuted(!muted)} aria-label="Toggle microphone" className={`flex h-14 w-14 items-center justify-center rounded-full border ${muted ? 'border-[#FF7A00] bg-orange-50 text-[#FF7A00]' : 'tv-surface tv-text tv-border'}`}><Mic size={21} /></button><button onClick={() => navigate('/contact')} aria-label="End call" className="flex h-16 w-16 items-center justify-center rounded-full bg-red-500 text-white shadow-lg shadow-red-200 active:scale-95"><PhoneOff size={25} /></button><button onClick={() => setSpeaker(!speaker)} aria-label="Toggle speaker" className={`flex h-14 w-14 items-center justify-center rounded-full border ${speaker ? 'border-[#FF7A00] bg-orange-50 text-[#FF7A00]' : 'tv-surface tv-text tv-border'}`}><Volume2 size={21} /></button></div></AnimatedPage>
}
