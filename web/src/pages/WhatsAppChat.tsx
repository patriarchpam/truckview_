import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, CheckCheck, Send } from 'lucide-react'
import { motion } from 'framer-motion'
import { AnimatedPage } from '../components/AnimatedPage'
import { BrandLogo } from '../components/BrandLogo'

interface Message { id: number; text: string; sender: 'user' | 'support'; time: string }
const welcome: Message = { id: 1, text: 'Hello! Welcome to TruckView Support. How can we help today?', sender: 'support', time: '10:00' }
const quickReplies = ['I need roadside help', 'Check a service request', 'Schedule maintenance']

export function WhatsAppChat() {
  const navigate = useNavigate()
  const [messages, setMessages] = useState<Message[]>([welcome])
  const [input, setInput] = useState('')
  const send = (value: string) => { if (!value.trim()) return; const message: Message = { id: Date.now(), text: value.trim(), sender: 'user', time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }; setMessages((previous) => [...previous, message]); setInput(''); window.setTimeout(() => setMessages((previous) => [...previous, { id: Date.now() + 1, text: 'Thanks for the details. A support specialist will be with you shortly.', sender: 'support', time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }]), 900) }
  return <AnimatedPage className="tv-page"><header className="flex items-center gap-3 border-b tv-border px-4 py-3"><button onClick={() => navigate('/contact')} aria-label="Back to contact" className="tv-text flex h-9 w-9 items-center justify-center rounded-full border tv-border"><ArrowLeft size={19} /></button><BrandLogo mini /><div><h1 className="tv-text text-sm font-semibold">Support chat</h1><p className="tv-muted text-[11px]">Online</p></div></header><main className="tv-soft flex flex-1 flex-col overflow-y-auto px-4 py-5 no-scrollbar"><div className="space-y-3">{messages.map((message) => <motion.div key={message.id} initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} className={`flex ${message.sender === 'user' ? 'justify-end' : 'justify-start'}`}><div className={`${message.sender === 'user' ? 'bg-[#0A1F44] text-white' : 'tv-surface tv-text border tv-border'} max-w-[82%] rounded-2xl px-3.5 py-2.5 text-sm`}><p>{message.text}</p><span className={`mt-1 flex items-center justify-end gap-1 text-[10px] ${message.sender === 'user' ? 'text-slate-300' : 'tv-muted'}`}>{message.time}{message.sender === 'user' && <CheckCheck size={13} />}</span></div></motion.div>)}</div>{messages.length < 3 && <div className="mt-4 flex flex-wrap gap-2">{quickReplies.map((reply) => <button key={reply} onClick={() => send(reply)} className="rounded-full border border-orange-200 bg-orange-50 px-3 py-2 text-xs font-semibold text-[#FF7A00]">{reply}</button>)}</div>}</main><form onSubmit={(event) => { event.preventDefault(); send(input) }} className="tv-nav flex items-center gap-2 border-t tv-border p-3"><input value={input} onChange={(event) => setInput(event.target.value)} placeholder="Type a message..." className="tv-input flex-1 rounded-full border px-4 py-3 text-sm placeholder:text-slate-400" /><button type="submit" aria-label="Send message" className="flex h-11 w-11 items-center justify-center rounded-full bg-[#FF7A00] text-white active:scale-95"><Send size={18} /></button></form></AnimatedPage>
}
