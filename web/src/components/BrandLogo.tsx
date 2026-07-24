import React from 'react'

const logoUrl = 'https://cdn.magicpatterns.com/uploads/uesRGfbYRmZKB7thKWepJ2/image.png'

type BrandLogoProps = {
  compact?: boolean
  mini?: boolean
  className?: string
}

export function BrandLogo({ compact = false, mini = false, className = '' }: BrandLogoProps) {
  const dimensions = mini ? 'h-[31px] w-[48px]' : compact ? 'h-[51px] w-[78px]' : 'h-[137px] w-[210px]'
  const imageSize = mini ? 'w-[112px] -left-[2px] -top-[2px]' : compact ? 'w-[183px] -left-[3px] -top-[4px]' : 'w-[495px] -left-[8px] -top-[10px]'

  return (
    <div className={`relative shrink-0 overflow-hidden rounded-md bg-white ${dimensions} ${className}`}>
      <img src={logoUrl} alt="TruckView Nigeria Enterprises" className={`absolute max-w-none ${imageSize}`} />
    </div>
  )
}
