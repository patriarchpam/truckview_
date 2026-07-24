import React from 'react'
import { Home, PlusCircle, Phone, User } from 'lucide-react'
import { useLocation, useNavigate } from 'react-router-dom'

const navItems = [
  { path: '/dashboard', icon: Home, label: 'Home' },
  { path: '/request', icon: PlusCircle, label: 'Request' },
  { path: '/contact', icon: Phone, label: 'Contact' },
  { path: '/profile', icon: User, label: 'Profile' },
]

export function BottomNav() {
  const location = useLocation()
  const navigate = useNavigate()

  return (
    <nav aria-label="Primary navigation" className="tv-nav tv-shadow absolute inset-x-0 bottom-0 z-50 flex h-20 items-center justify-around border-t tv-border px-3 pb-4 pt-2">
      {navItems.map(({ path, icon: Icon, label }) => {
        const isActive = location.pathname === path
        return (
          <button key={path} onClick={() => navigate(path)} aria-current={isActive ? 'page' : undefined} className={`flex w-16 flex-col items-center gap-1 rounded-xl py-1 text-[10px] font-semibold transition ${isActive ? 'text-[#FF7A00]' : 'tv-muted'}`}>
            <span className={`flex h-7 w-9 items-center justify-center rounded-xl ${isActive ? 'bg-orange-100' : ''}`}><Icon size={20} strokeWidth={isActive ? 2.6 : 2} /></span>
            {label}
          </button>
        )
      })}
    </nav>
  )
}
