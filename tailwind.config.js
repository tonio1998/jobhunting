module.exports = {
  content: [
    './resources/**/*.blade.php',
    './resources/**/*.js',
    './resources/**/*.vue',
  ],
  theme: {
    extend: {},
  },
  plugins: [require('daisyui')],
    daisyui: {
    themes: ["light"],
    base: true,      
    styled: true,
    utils: true,  
    logs: false,
    }
}
