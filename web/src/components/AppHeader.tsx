import React from 'react'
import { Moon, Sun } from 'lucide-react'
import { BrandLogo } from './BrandLogo'
import { useTheme } from './ThemeContext'

type AppHeaderProps = {
  title?: string
  action?: React.ReactNode
}

export function AppHeader({ title, action }: AppHeaderProps) {
  const { theme, toggleTheme } = useTheme()

  return (
    <header className="flex items-center justify-between px-6 pb-5 pt-5">
      <div className="flex items-center gap-3">
        <BrandLogo compact />
        {title && <span className="tv-text border-l tv-border pl-3 text-sm font-semibold">{title}</span>}
      </div>
      <div className="flex items-center gap-2">
        <button
          onClick={toggleTheme}
          aria-label="Toggle light and dark mode"
          className="tv-text flex h-9 w-9 items-center justify-center rounded-full border tv-border"
        >
          {theme === 'light' ? <Moon size={17} /> : <Sun size={17} />}
        </button>
        {action}
      </div>
    </header>
  )
}
