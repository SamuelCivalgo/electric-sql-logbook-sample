/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './App.{js,jsx,ts,tsx}',
    './app/**/*.{js,jsx,ts,tsx}',
    './components/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        cBlue: '#0091FF',
        cWhite: '#F9F9F9',
        cLightGray: '#EFEFEF',
        cBlack: '#3A3A3A',
      },
      fontSize: {
        cXSM: '14px',
        cSM: '16px',
        cMD: '18px',
        cXL: '20px',
        cXXL: '26px',
      },
    },
  },
  plugins: [],
}
