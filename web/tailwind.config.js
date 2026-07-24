export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
    "./*.{js,ts,jsx,tsx}",
    "./**/*.{js,ts,jsx,tsx}"
  ],
  theme: {
    extend: {
      colors: {
        navy: {
          900: '#0f1b2d',
          800: '#1e3a5f',
          700: '#2a4a75',
        },
        brand: {
          orange: '#f97316',
          orangeHover: '#ea580c',
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
