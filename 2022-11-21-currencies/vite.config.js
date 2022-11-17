import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  worker: {
    rollupOptions: {
      input: {
        eu: path.resolve(__dirname, "src/euTime/App.jsx"),
        us: path.resolve(__dirname, "src/usTime/App.jsx"),
        host: path.resolve(__dirname, "src/App.jsx"),
      },
    },
  },
});
