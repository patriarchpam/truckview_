import React, { useRef, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { ArrowLeft, ShieldCheck } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

const codeLength = 6

export function OtpScreen() {
  const navigate = useNavigate()
  const location = useLocation()
  const email = (location.state as { email?: string } | null)?.email ?? 'your email'
  const [code, setCode] = useState(Array(codeLength).fill(''))
  const inputs = useRef<Array<HTMLInputElement | null>>([])

  const updateCode = (value: string, index: number) => {
    const digit = value.replace(/\D/g, '').slice(-1)
    const next = [...code]
    next[index] = digit
    setCode(next)
    if (digit && index < codeLength - 1) inputs.current[index + 1]?.focus()
  }

  const verifyCode = (event: React.FormEvent) => {
    event.preventDefault()
    if (code.every(Boolean)) navigate('/reset-password', { state: { email } })
  }

  return (
    <AnimatedPage className="tv-page px-6 pb-8 pt-8">
      <button onClick={() => navigate('/forgot-password')} className="tv-muted mb-8 flex items-center gap-2 text-sm font-semibold"><ArrowLeft size={19} /> Change email</button>
      <div className="mb-10 flex flex-col items-center text-center">
        <div className="tv-soft flex h-16 w-16 items-center justify-center rounded-2xl border tv-border"><ShieldCheck className="text-[#FF7A00]" size={30} /></div>
        <BrandLogo compact className="mt-5 w-14" />
        <h1 className="tv-text mt-4 text-2xl font-bold">Verify it’s you</h1>
        <p className="tv-muted mt-2 max-w-[300px] text-sm leading-6">Enter the 6-digit code sent to <span className="tv-text font-semibold">{email}</span>.</p>
      </div>
      <form onSubmit={verifyCode} className="flex flex-1 flex-col">
        <div className="flex justify-between gap-2" aria-label="Six digit verification code">
          {code.map((digit, index) => (
            <input key={index} ref={(element) => { inputs.current[index] = element }} value={digit} inputMode="numeric" maxLength={1} onChange={(event) => updateCode(event.target.value, index)} onKeyDown={(event) => { if (event.key === 'Backspace' && !code[index] && index > 0) inputs.current[index - 1]?.focus() }} className="tv-input h-14 w-full rounded-xl border text-center text-xl font-bold" aria-label={`Verification digit ${index + 1}`} />
          ))}
        </div>
        <p className="tv-muted mt-5 text-center text-sm">Didn’t receive a code? <button type="button" className="font-semibold text-[#FF7A00]">Resend</button></p>
        <button type="submit" disabled={!code.every(Boolean)} className="mt-auto w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 transition enabled:active:scale-[0.98] disabled:cursor-not-allowed disabled:opacity-45">Verify code</button>
      </form>
    </AnimatedPage>
  )
}
