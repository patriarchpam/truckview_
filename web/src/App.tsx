import React from 'react'
import { BrowserRouter as Router, Route, Routes, useLocation } from 'react-router-dom'
import { AnimatePresence } from 'framer-motion'
import { PhoneFrame } from './components/PhoneFrame'
import { BottomNav } from './components/BottomNav'
import { ThemeProvider } from './components/ThemeContext'
import { SplashScreen } from './pages/SplashScreen'
import { LoginScreen } from './pages/LoginScreen'
import { RegisterScreen } from './pages/RegisterScreen'
import { ForgotPassword } from './pages/ForgotPassword'
import { OtpScreen } from './pages/OtpScreen'
import { ResetPassword } from './pages/ResetPassword'
import { Dashboard } from './pages/Dashboard'
import { ServiceRequest } from './pages/ServiceRequest'
import { ContactScreen } from './pages/ContactScreen'
import { ProfileScreen } from './pages/ProfileScreen'
import { LogoutScreen } from './pages/LogoutScreen'
import { CallScreen } from './pages/CallScreen'
import { WhatsAppChat } from './pages/WhatsAppChat'

function AppRoutes() {
  const location = useLocation()
  const showBottomNav = ['/dashboard', '/request', '/contact', '/profile'].includes(location.pathname)

  return (
    <>
      <AnimatePresence mode="wait">
        <Routes location={location} key={location.pathname}>
          <Route path="/" element={<SplashScreen />} />
          <Route path="/login" element={<LoginScreen />} />
          <Route path="/register" element={<RegisterScreen />} />
          <Route path="/forgot-password" element={<ForgotPassword />} />
          <Route path="/verify-otp" element={<OtpScreen />} />
          <Route path="/reset-password" element={<ResetPassword />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/request" element={<ServiceRequest />} />
          <Route path="/contact" element={<ContactScreen />} />
          <Route path="/profile" element={<ProfileScreen />} />
          <Route path="/logout" element={<LogoutScreen />} />
          <Route path="/call" element={<CallScreen />} />
          <Route path="/whatsapp" element={<WhatsAppChat />} />
        </Routes>
      </AnimatePresence>
      {showBottomNav && <BottomNav />}
    </>
  )
}

export function App() {
  return (
    <ThemeProvider>
      <Router>
        <PhoneFrame><AppRoutes /></PhoneFrame>
      </Router>
    </ThemeProvider>
  )
}
