import React, { useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { CheckCircle2, ChevronDown, MapPin, Wrench } from 'lucide-react'
import { AnimatedPage } from '../components/AnimatedPage'
import { AppHeader } from '../components/AppHeader'

type RequestState = { selectedService?: string } | null

export function ServiceRequest() {
  const location = useLocation()
  const navigate = useNavigate()
  const [serviceType, setServiceType] = useState((location.state as RequestState)?.selectedService ?? 'engine')
  const [address, setAddress] = useState('')
  const [description, setDescription] = useState('')
  const [submitted, setSubmitted] = useState(false)

  if (submitted) return <AnimatedPage className="tv-page items-center justify-center px-6 text-center"><CheckCircle2 size={56} className="text-emerald-500" /><h1 className="tv-text mt-5 text-2xl font-bold">Request received</h1><p className="tv-muted mt-2 max-w-[270px] text-sm leading-6">We’ll contact you shortly with dispatch details.</p><button onClick={() => navigate('/dashboard')} className="mt-8 w-full rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white">Back home</button></AnimatedPage>

  return <AnimatedPage className="tv-page pb-24"><AppHeader title="Request service" /><form onSubmit={(event) => { event.preventDefault(); setSubmitted(true) }} className="flex flex-1 flex-col overflow-y-auto px-6 no-scrollbar"><p className="tv-muted mb-6 text-sm">Share a few details and we’ll arrange help.</p><FieldLabel label="Service type" /><div className="relative"><select value={serviceType} onChange={(event) => setServiceType(event.target.value)} className="tv-input w-full appearance-none rounded-2xl border px-4 py-4 text-sm"><option value="engine">Engine repair</option><option value="tire">Tyre fix</option><option value="rescue">Emergency rescue</option><option value="maint">Maintenance</option><option value="other">Other issue</option></select><ChevronDown size={18} className="tv-muted pointer-events-none absolute right-4 top-1/2 -translate-y-1/2" /></div><div className="mt-5"><FieldLabel label="Location" /><div className="relative"><MapPin size={19} className="absolute left-4 top-1/2 -translate-y-1/2 text-[#FF7A00]" /><input required value={address} onChange={(event) => setAddress(event.target.value)} placeholder="Street address or landmark" className="tv-input w-full rounded-2xl border py-4 pl-12 pr-4 text-sm placeholder:text-slate-400" /></div></div><div className="mt-5"><FieldLabel label="What happened?" /><textarea required value={description} onChange={(event) => setDescription(event.target.value)} placeholder="Briefly describe the issue" className="tv-input min-h-[128px] w-full resize-none rounded-2xl border p-4 text-sm placeholder:text-slate-400" /></div><button type="submit" className="mt-auto mb-4 flex w-full items-center justify-center gap-2 rounded-2xl bg-[#FF7A00] py-4 font-semibold text-white shadow-md shadow-orange-200"><Wrench size={18} /> Submit request</button></form></AnimatedPage>
}

function FieldLabel({ label }: { label: string }) { return <label className="tv-text mb-2 block text-sm font-semibold">{label}</label> }
