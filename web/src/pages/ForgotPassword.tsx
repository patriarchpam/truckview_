import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Mail } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

export function ForgotPassword() {
  const navigate = useNavigate()
  const [email, setEmail] = useState('')

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault()
    navigate('/verify-otp', { state: { email } })
  }

  return (
    <AnimatedPage className="tv-page px-6 pb-8 pt-8">
      <button onClick={() => navigate('/login')} className="tv-muted mb-8 flex items-center gap-2 text-sm font-semibold">
        <ArrowLeft size={19} /> Back to login
      </button>
      <div className="mb-10 flex flex-col items-center text-center">
        <BrandLogo compact />
        <h1 className="tv-text mt-6 text-2xl font-bold">Reset your password</h1>
        <p className="tv-muted mt-2 max-w-[290px] text-sm leading-6">Enter the email associated with your account. We’ll send a secure verification code.</p>
      </div>
      <form onSubmit={handleSubmit} className="flex flex-1 flex-col">
        <label className="tv-text mb-2 text-sm font-semibold">Email address</label>
        <div className="relative">
          <Mail size={19} className="tv-muted absolute left-4 top-1/2 -translate-y-1/2" />
          <input type="email" required value={email} onChange={(event) => setEmail(event.target.value)} placeholder="you@example.com" className="tv-input w-full rounded-2xl border py-4 pl-12 pr-4 text-sm placeholder:text-slate-400" />
        </div>
        <button type="submit" className="mt-auto w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 transition active:scale-[0.98]">Send verification code</button>
      </form>
    </AnimatedPage>
  )
}
