module.exports = {
  theme: {
    extend: {},
    'flex-basis': theme => ({
      '1': '100%',
      '2': '50%',
      '3': '33.333333%',
      '4': '25%',
      '5': '20%',
      '6': '16.666666%',
      '7': '14.285714%',
      '0': '12.5%',
    }),
  },
  variants: {
    'flex-basis': ['responsive'],
  },
  plugins: [
    require('@tailwindcss/ui'),
    require('@tkh/tailwind-plugin-flex-basis/flex-basis.js')(),
  ],
}
