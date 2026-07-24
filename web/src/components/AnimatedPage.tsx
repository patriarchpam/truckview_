import React from 'react'
import { motion } from 'framer-motion'
const pageVariants = {
  initial: {
    opacity: 0,
    x: 20,
  },
  in: {
    opacity: 1,
    x: 0,
  },
  out: {
    opacity: 0,
    x: -20,
  },
}
const pageTransition = {
  type: 'tween',
  ease: 'anticipate',
  duration: 0.3,
}
export function AnimatedPage({
  children,
  className = '',
}: {
  children: React.ReactNode
  className?: string
}) {
  return (
    <motion.div
      initial="initial"
      animate="in"
      exit="out"
      variants={pageVariants}
      transition={pageTransition}
      className={`w-full h-full flex flex-col ${className}`}
    >
      {children}
    </motion.div>
  )
}
