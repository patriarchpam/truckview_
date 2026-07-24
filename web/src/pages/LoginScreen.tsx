import React, { useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { CheckCircle2, Lock, Mail } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'
import { supabase } from '../lib/supabaseClient'

type LoginLocationState = {
  registrationEmail?: string
  accountCreated?: boolean
}

export function LoginScreen() {
  const navigate = useNavigate()
  const location = useLocation()
  const state = location.state as LoginLocationState | null
  const [email, setEmail] = useState(state?.registrationEmail ?? '')
  const [password, setPassword] = useState('')

  const handleLogin = async (event: React.FormEvent) => {
    event.preventDefault()
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })
    if (error) {
      alert(error.message)
    } else {
      navigate('/dashboard')
    }
  }

  return (
    <AnimatedPage className="tv-page px-6 pb-8 pt-9">
      <div className="mb-8 flex flex-col items-center text-center"><BrandLogo /><h1 className="tv-text mt-7 text-2xl font-bold">Welcome back</h1><p className="tv-muted mt-2 text-sm">Sign in to manage your vehicle care.</p></div>
      {state?.accountCreated && <div role="status" className="mb-5 flex items-start gap-3 rounded-2xl border border-emerald-200 bg-emerald-50 p-3 text-left"><CheckCircle2 size={19} className="mt-0.5 shrink-0 text-emerald-600" /><p className="text-xs leading-5 text-emerald-800"><span className="font-semibold">Account created.</span> Please sign in with your new details.</p></div>}
      <form onSubmit={handleLogin} className="flex flex-1 flex-col gap-5">
        <FormField label="Email address" icon={<Mail size={19} />} type="email" value={email} onChange={setEmail} placeholder="you@example.com" />
        <FormField label="Password" icon={<Lock size={19} />} type="password" value={password} onChange={setPassword} placeholder="Enter your password" />
        <div className="flex justify-end"><button type="button" onClick={() => navigate('/forgot-password')} className="text-sm font-semibold text-[#FF7A00]">Forgot password?</button></div>
        <div className="mt-auto"><button type="submit" className="w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 active:scale-[0.98]">Login</button><p className="tv-muted mt-6 text-center text-sm">New to TruckView? <button type="button" onClick={() => navigate('/register')} className="font-bold text-[#FF7A00]">Create account</button></p></div>
      </form>
    </AnimatedPage>
  )
}

function FormField({ label, icon, type, value, onChange, placeholder }: { label: string; icon: React.ReactNode; type: string; value: string; onChange: (value: string) => void; placeholder: string }) {
  return <div><label className="tv-text mb-2 block text-sm font-semibold">{label}</label><div className="relative"><span className="tv-muted absolute left-4 top-1/2 -translate-y-1/2">{icon}</span><input required type={type} value={value} onChange={(event) => onChange(event.target.value)} placeholder={placeholder} className="tv-input w-full rounded-2xl border py-4 pl-12 pr-4 text-sm placeholder:text-slate-400" /></div></div>
}
