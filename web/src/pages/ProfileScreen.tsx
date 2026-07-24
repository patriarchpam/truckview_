import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Bell, Camera, Car, ChevronRight, LogOut, Moon, Shield, Sun, User } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'
import { useTheme } from '../components/ThemeContext'

const settings = [
  { icon: Car, title: 'My vehicles', description: '2 vehicles saved' },
  { icon: Bell, title: 'Notifications', description: 'Manage alerts' },
  { icon: Shield, title: 'Privacy & security', description: 'Password and sign-in' },
]

export function ProfileScreen() {
  const navigate = useNavigate()
  const { theme, toggleTheme } = useTheme()

  return (
    <AnimatedPage className="tv-page pb-24">
      <header className="flex items-center justify-between px-6 pb-5 pt-5">
        <BrandLogo compact />
        <button onClick={toggleTheme} aria-label="Toggle light and dark mode" className="tv-text flex h-9 w-9 items-center justify-center rounded-full border tv-border">{theme === 'light' ? <Moon size={17} /> : <Sun size={17} />}</button>
      </header>
      <main className="flex-1 overflow-y-auto px-6 no-scrollbar">
        <section className="mb-7 flex items-center gap-4">
          <div className="relative"><div className="flex h-16 w-16 items-center justify-center rounded-full border-2 border-[#0A1F44] bg-orange-50"><User size={29} className="text-[#0A1F44]" /></div><button aria-label="Change profile photo" className="absolute -bottom-1 -right-1 flex h-6 w-6 items-center justify-center rounded-full bg-[#FF7A00] text-white"><Camera size={12} /></button></div>
          <div><h1 className="tv-text text-xl font-bold">John Doe</h1><p className="tv-muted mt-1 text-xs">john@example.com</p></div>
        </section>
        <section className="space-y-2">
          {settings.map(({ icon: Icon, title, description }) => <button key={title} className="tv-surface flex w-full items-center gap-3 rounded-2xl border tv-border p-3.5 text-left active:scale-[0.99]"><span className="text-[#FF7A00]"><Icon size={20} /></span><span className="flex-1"><span className="tv-text block text-sm font-semibold">{title}</span><span className="tv-muted mt-0.5 block text-xs">{description}</span></span><ChevronRight size={17} className="tv-muted" /></button>)}
        </section>
        <button onClick={() => navigate('/logout')} className="mt-6 flex items-center gap-2 text-sm font-semibold text-red-600"><LogOut size={18} /> Log out</button>
      </main>
    </AnimatedPage>
  )
}
