/** @type {import('tailwindcss').Config} */
/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./index.html",
        "./src/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        extend: {
            colors: {
                // Adding CampusNexus custom colors from CSS variables if needed, 
                // but for now relying on CSS variables in index.css is fine 
                // as long as PostCSS processes it.
            }
        },
    },
    plugins: [require("daisyui")],
    daisyui: {
        themes: ["light"],
    },
}
