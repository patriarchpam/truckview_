import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Lock, Mail, Phone, User } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'
import { supabase } from '../lib/supabaseClient'

export function RegisterScreen() {
  const navigate = useNavigate()
  const [formData, setFormData] = useState({ name: '', email: '', phone: '', password: '' })
  const fields = [
    { key: 'name', label: 'Full name', type: 'text', placeholder: 'John Doe', icon: <User size={19} /> },
    { key: 'email', label: 'Email address', type: 'email', placeholder: 'you@example.com', icon: <Mail size={19} /> },
    { key: 'phone', label: 'Phone number', type: 'tel', placeholder: '+234 000 000 0000', icon: <Phone size={19} /> },
    { key: 'password', label: 'Create password', type: 'password', placeholder: 'At least 8 characters', icon: <Lock size={19} /> },
  ] as const

  const handleRegister = async (event: React.FormEvent) => {
    event.preventDefault()
    const { error } = await supabase.auth.signUp({
      email: formData.email,
      password: formData.password,
      options: {
        data: {
          full_name: formData.name,
          phone: formData.phone,
        }
      }
    })
    if (error) {
      alert(error.message)
    } else {
      navigate('/login', { state: { registrationEmail: formData.email, accountCreated: true } })
    }
  }

  return (
    <AnimatedPage className="tv-page overflow-y-auto px-6 pb-8 pt-7 no-scrollbar">
      <div className="mb-7 flex flex-col items-center text-center"><BrandLogo compact /><h1 className="tv-text mt-5 text-2xl font-bold">Create your account</h1><p className="tv-muted mt-1 text-sm">Professional care starts here.</p></div>
      <form onSubmit={handleRegister} className="flex flex-col gap-4">
        {fields.map((field) => <div key={field.key}><label className="tv-text mb-1.5 block text-sm font-semibold">{field.label}</label><div className="relative"><span className="tv-muted absolute left-4 top-1/2 -translate-y-1/2">{field.icon}</span><input required type={field.type} value={formData[field.key]} onChange={(event) => setFormData({ ...formData, [field.key]: event.target.value })} placeholder={field.placeholder} className="tv-input w-full rounded-2xl border py-3.5 pl-12 pr-4 text-sm placeholder:text-slate-400" /></div></div>)}
        <button type="submit" className="mt-4 w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-lg shadow-orange-200 active:scale-[0.98]">Create account</button>
        <p className="tv-muted pb-2 text-center text-sm">Already registered? <button type="button" onClick={() => navigate('/login')} className="font-bold text-[#FF7A00]">Login</button></p>
      </form>
    </AnimatedPage>
  )
}
