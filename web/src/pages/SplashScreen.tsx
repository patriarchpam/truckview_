import React from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowRight } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

export function SplashScreen() {
  const navigate = useNavigate()
  return (
    <AnimatedPage className="tv-page justify-between px-6 pb-10 pt-16">
      <div className="flex flex-1 flex-col items-center justify-center text-center">
        <div className="rounded-[2rem] border-2 border-[#0A1F44] bg-white p-3 shadow-xl shadow-slate-200"><BrandLogo /></div>
        <span className="mt-9 rounded-full border border-orange-200 bg-orange-50 px-4 py-2 text-xs font-bold uppercase tracking-[0.16em] text-[#FF7A00]">Roadside assistance</span>
        <h1 className="tv-text mt-5 text-3xl font-extrabold tracking-tight">Your satisfaction is<br />our clarion call.</h1>
        <p className="tv-muted mt-4 max-w-[285px] text-sm leading-6">Professional repair and rescue support for every vehicle type.</p>
      </div>
      <button onClick={() => navigate('/login')} className="flex w-full items-center justify-center gap-2 rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 transition active:scale-[0.98]">Get started <ArrowRight size={19} /></button>
    </AnimatedPage>
  )
}
