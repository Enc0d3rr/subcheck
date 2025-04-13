# 🔍 subcheck

**subcheck** es una herramienta en Bash para verificar subdominios activos usando 'curl'. Es simple, rápida y útil para pruebas iniciales de reconocimiento.

---

## 🚀 ¿Cómo usarla?

```bash
bash subcheck.sh -s "www,login,portal" -d ejemplo.com -p 80

📌 Parámetros
-s	Lista de subdominios (separados por comas, entre comillas dobles)
-d	Dominio objetivo
-p	Puerto a escanear
-h	Muestra el panel de ayuda

💾 Ejemplo de uso
bash subdomainChecker.sh -s "www,login,mail" -d github.com -p 80

📂 Salida

Los subdominios activos se guardarán automáticamente en liveSubdomains.txt

🧠 Autor
Instagram: @enc0.d3r

⚠️ Disclaimer

Esta herramienta es solo para fines educativos. No me hago responsable del mal uso.
