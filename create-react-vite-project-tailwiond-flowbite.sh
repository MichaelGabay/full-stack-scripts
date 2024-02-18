#!bin/bash
read -p "Enter the project name: " projectName


npm create vite@latest $projectName -- --template react;
cd $projectName
npm install -D tailwindcss postcss autoprefixer flowbite flowbite-react;
npx tailwindcss init -p;
echo "/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
    'node_modules/flowbite-react/lib/esm/**/*.js'
  ],
  theme: {
    extend: {},
  },
  plugins: [
      require('flowbite/plugin')
  ],
}" > tailwind.config.js;
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/index.css;
rm src/App.css;

echo "import React from 'react'

const App = () => {
  return (
    <div className='h-[100vh] flex justify-center items-center'>
      <h1 className='cursor-pointer text-7xl font-extrabold text-teal-600 tracking-wide leading-tight transition-transform transform hover:scale-110'>
        <span className='bg-gradient-to-r from-teal-400 to-blue-500 text-transparent bg-clip-text'>
          <a href='https://vitejs.dev/' target='_blank'> vite</a> + <a href='https://tailwindcss.com/' target='_blank'> tailwind </a> + <a href='https://www.flowbite-react.com/' target='_blank'>flowbite</a>
        </span>
      </h1>
    </div>
  )
}
export default App" > src/App.jsx;

echo "import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <App />
)" > src/main.jsx;

mkdir tests;

echo "            ---folder structure---
/public: Public assets like HTML files.
/tests: Folder for testing files.
/src: Contains all the source code.
    /assets: For static assets like images and styles.
    /components: Reusable UI components.
    /pages: Components that represent entire pages or sections.
    /services: API services or utilities.
    /utils: General utility functions.
    /context: React context providers.
    /hooks: Custom React hooks.
    /redux: Redux setup with actions, reducers, and store configuration.
    /routes: Application routing setup.
    App.js: The main component where the app starts.
    main.js: The entry point of the application.
    index.html: The root html page.
    index.css global style.
    
.gitignore: List of files and directories not tracked by git.
package.json: Project metadata and dependencies.
README.md: Project documentation.
.eslintrc: ESLint configuration.
.env: For all envireoment variables" > documentation.txt;
touch .env;
cd src;
rm assets/react.svg;
mkdir components pages services utils context hooks redux routes;
