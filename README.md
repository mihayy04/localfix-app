# LocalFix App 🌱

Platforma web pentru raportarea si gestionarea avariilor din oras. Proiect universitar.

## Descriere
LocalFix este un sistem client-server care faciliteaza comunicarea rapida si transparenta dintre cetateni si autoritatile locale. Cetatenii pot raporta probleme din spatiul public (infrastructura, curatenie, iluminat), iar inspectorii le pot vizualiza si gestiona statusul printr-un panou web centralizat.

## Tehnologii folosite
* **Frontend:** HTML, CSS, JavaScript (Vanilla JS)
* **Backend:** Node.js cu Express.js
* **Baza de date:** MySQL (structura arhitecturala)

## Structura Proiectului
* `public/` - Contine interfata grafica a aplicatiei (`index.html`).
* `server.js` - API-ul REST si logica de backend.
* `init_database.sql` - Scriptul de initializare pentru baza de date MySQL.
* `package.json` - Detalii despre dependentele proiectului Node.js.

## Cum sa rulezi proiectul local
Pentru a testa functionalitatea "Mock-up" a platformei:

1. Asigura-te ca ai instalat [Node.js](https://nodejs.org/).
2. Deschide terminalul in folderul radacina al proiectului.
3. Instaleaza dependentele ruland comanda:
   ```bash
   npm install
