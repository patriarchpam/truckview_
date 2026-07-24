import React from 'react'
import { Battery, Signal, Wifi } from 'lucide-react'
import { useTheme } from './ThemeContext'

export function PhoneFrame({ children }: { children: React.ReactNode }) {
  const { theme } = useTheme()
  const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
  const isLight = theme === 'light'

  return (
    <div className="flex min-h-screen items-center justify-center bg-[#111827] p-3 sm:p-8">
      <div className="relative h-[844px] w-full max-w-[390px] overflow-hidden rounded-[3rem] border-[8px] border-[#111827] bg-white shadow-2xl ring-1 ring-white/15">
        <div className="absolute inset-x-0 top-0 z-50 flex h-7 justify-center">
          <div className="h-7 w-36 rounded-b-3xl bg-[#111827]" />
        </div>
        <div className={`absolute inset-x-0 top-0 z-40 flex h-12 items-center justify-between px-6 pt-2 text-xs font-semibold ${isLight ? 'text-[#0A1F44]' : 'text-white'}`}>
          <span>{time}</span>
          <div className="flex items-center space-x-2"><Signal size={14} /><Wifi size={14} /><Battery size={16} /></div>
        </div>
        <div className="tv-page relative flex h-full w-full flex-col overflow-hidden pt-12">{children}</div>
      </div>
    </div>
  )
}
