import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Clock, MapPin, MessageCircle, Phone } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { AppHeader } from '../components/AppHeader'

export function ContactScreen() {
  const navigate = useNavigate()

  return (
    <AnimatedPage className="tv-page pb-24">
      <AppHeader title="Support" />
      <main className="flex-1 overflow-y-auto px-6 no-scrollbar">
        <p className="tv-muted mb-6 text-sm">Our team is available whenever you need help.</p>
        <div className="space-y-3">
          <button onClick={() => navigate('/call')} className="flex w-full items-center gap-4 rounded-2xl bg-[#0A1F44] p-4 text-left shadow-sm shadow-blue-950/20 active:scale-[0.99]">
            <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-white/15 text-white"><Phone size={21} /></span>
            <span className="flex-1"><span className="block text-sm font-semibold text-white">Call support</span><span className="mt-1 block text-xs text-slate-300">Speak directly with our team</span></span>
            <span className="text-lg text-white">→</span>
          </button>
          <button onClick={() => navigate('/whatsapp')} className="tv-surface flex w-full items-center gap-4 rounded-2xl border tv-border p-4 text-left active:scale-[0.99]">
            <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-orange-50 text-[#FF7A00]"><MessageCircle size={21} /></span>
            <span className="flex-1"><span className="tv-text block text-sm font-semibold">WhatsApp chat</span><span className="tv-muted mt-1 block text-xs">Message us for quick assistance</span></span>
            <span className="text-lg text-[#FF7A00]">→</span>
          </button>
        </div>
        <section className="mt-8 space-y-4 border-t tv-border pt-6">
          <div className="flex items-start gap-3"><Clock size={18} className="mt-0.5 text-[#FF7A00]" /><div><h2 className="tv-text text-sm font-semibold">Always available</h2><p className="tv-muted mt-1 text-xs leading-5">Emergency assistance is available 24/7.</p></div></div>
          <div className="flex items-start gap-3"><MapPin size={18} className="mt-0.5 text-[#FF7A00]" /><div><h2 className="tv-text text-sm font-semibold">Main office</h2><p className="tv-muted mt-1 text-xs leading-5">123 Mechanics Way, Auto District, Lagos</p></div></div>
        </section>
      </main>
    </AnimatedPage>
  )
}
