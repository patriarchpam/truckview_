import React from 'react'
import { useNavigate } from 'react-router-dom'
import { AlertTriangle, CircleDashed, Settings, User, Wrench } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { AppHeader } from '../components/AppHeader'

const services = [
  { id: 'engine', title: 'Engine repair', icon: Wrench },
  { id: 'tire', title: 'Tyre fix', icon: CircleDashed },
  { id: 'rescue', title: 'Emergency rescue', icon: AlertTriangle },
  { id: 'maint', title: 'Maintenance', icon: Settings },
]

export function Dashboard() {
  const navigate = useNavigate()

  return (
    <AnimatedPage className="tv-page pb-24">
      <AppHeader action={<button onClick={() => navigate('/profile')} aria-label="Open profile" className="flex h-9 w-9 items-center justify-center rounded-full border-2 border-[#0A1F44] bg-white"><User size={17} className="text-[#0A1F44]" /></button>} />
      <main className="flex-1 overflow-y-auto px-6 no-scrollbar">
        <section className="mb-7">
          <p className="tv-muted text-sm">Good morning, John</p>
          <h1 className="tv-text mt-1 text-2xl font-bold">What does your vehicle need?</h1>
        </section>
        <button onClick={() => navigate('/request')} className="tv-surface mb-7 flex w-full items-center gap-3 rounded-2xl border tv-border p-4 text-left active:scale-[0.99]">
          <span className="flex h-10 w-10 items-center justify-center rounded-xl bg-[#0A1F44] text-white"><Wrench size={19} /></span>
          <span className="flex-1"><span className="tv-text block text-sm font-semibold">Need help now?</span><span className="tv-muted mt-0.5 block text-xs">Request roadside support</span></span>
          <span className="text-lg text-[#FF7A00]">→</span>
        </button>
        <h2 className="tv-text mb-3 text-base font-semibold">Services</h2>
        <section className="grid grid-cols-2 gap-3 pb-24">
          {services.map(({ id, title, icon: Icon }) => <button key={id} onClick={() => navigate('/request', { state: { selectedService: id } })} className="tv-surface flex h-32 flex-col rounded-2xl border tv-border p-4 text-left transition active:scale-[0.98]"><span className="text-[#FF7A00]"><Icon size={22} /></span><span className="tv-text mt-auto text-sm font-semibold">{title}</span></button>)}
        </section>
      </main>
      <div className="absolute inset-x-6 bottom-24"><button onClick={() => navigate('/request')} className="flex w-full items-center justify-center gap-2 rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-md shadow-orange-200 active:scale-[0.98]"><Wrench size={18} /> Request service</button></div>
    </AnimatedPage>
  )
}
