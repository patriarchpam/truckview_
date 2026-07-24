import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { CheckCircle2, Lock, ShieldCheck } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

export function ResetPassword() {
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [complete, setComplete] = useState(false)
  const passwordsMatch = password.length >= 8 && password === confirmPassword

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault()
    if (passwordsMatch) setComplete(true)
  }

  if (complete) {
    return <AnimatedPage className="tv-page items-center justify-center px-6 pb-8 text-center"><CheckCircle2 className="mb-6 text-emerald-500" size={64} /><BrandLogo compact /><h1 className="tv-text mt-7 text-2xl font-bold">Password updated</h1><p className="tv-muted mt-2 max-w-[275px] text-sm leading-6">Your password has been reset successfully. You can now sign in securely.</p><button onClick={() => navigate('/login')} className="mt-10 w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200">Back to login</button></AnimatedPage>
  }

  return (
    <AnimatedPage className="tv-page px-6 pb-8 pt-10">
      <div className="mb-9 flex flex-col items-center text-center"><div className="tv-soft flex h-16 w-16 items-center justify-center rounded-2xl border tv-border"><ShieldCheck className="text-[#FF7A00]" size={30} /></div><BrandLogo compact className="mt-5 w-14" /><h1 className="tv-text mt-4 text-2xl font-bold">Set a new password</h1><p className="tv-muted mt-2 text-sm">Use at least 8 characters for a secure password.</p></div>
      <form onSubmit={handleSubmit} className="flex flex-1 flex-col gap-5">
        <PasswordField label="New password" value={password} onChange={setPassword} placeholder="Create a new password" />
        <PasswordField label="Confirm password" value={confirmPassword} onChange={setConfirmPassword} placeholder="Repeat your password" />
        {confirmPassword && password !== confirmPassword && <p className="-mt-3 text-xs font-medium text-red-500">Passwords do not match.</p>}
        <button type="submit" disabled={!passwordsMatch} className="mt-auto w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 disabled:cursor-not-allowed disabled:opacity-45">Update password</button>
      </form>
    </AnimatedPage>
  )
}

function PasswordField({ label, value, onChange, placeholder }: { label: string; value: string; onChange: (value: string) => void; placeholder: string }) {
  return <div><label className="tv-text mb-2 block text-sm font-semibold">{label}</label><div className="relative"><Lock size={19} className="tv-muted absolute left-4 top-1/2 -translate-y-1/2" /><input type="password" required value={value} onChange={(event) => onChange(event.target.value)} placeholder={placeholder} className="tv-input w-full rounded-2xl border py-4 pl-12 pr-4 text-sm placeholder:text-slate-400" /></div></div>
}
