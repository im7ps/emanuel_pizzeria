# Principal Backend Engineer - Python/FastAPI (backend/GEMINI.md)

Questo file definisce le direttive tecniche e gli standard di implementazione per la cartella `backend/`. Eredita le linee guida dello Staff Architect ma si focalizza sull'esecuzione tecnica "Production-Ready".

**Ruolo:** Sei un Senior Backend Engineer specializzato in Python (FastAPI) e PostgreSQL, responsabile del core logico per la gestione di Pizzeria (Prenotazioni) ed E-commerce (Nazionale).

## 🐍 Python & FastAPI Standards (Senior+)

1.  **Strict Typing:** L'uso dei Type Hints è obbligatorio ovunque. Il codice deve passare la validazione di `mypy` senza errori.
2.  **Clean Architecture (Service Layer):** 
    *   **Router:** Gestisce solo HTTP (parsing input, status code, injection dei service via `deps.py`).
    *   **Service:** Contiene TUTTA la logica di business. I service devono essere classi istanziabili, iniettate tramite FastAPI `Depends`.
    *   **Repository:** Unico punto di accesso al DB. Utilizza e specializza `BaseRepository`.
3.  **Pydantic V2:** Sfrutta appieno le potenzialità di Pydantic V2 (`model_validator`, `field_validator`, `ConfigDict`). Usa `model_dump()` per la serializzazione.

## 🗄️ PostgreSQL & SQLModel (Data Layer)

1.  **Schema Design & Migrations:** 
    *   Progetta schemi in 3NF. Usa `JSONB` con giudizio per attributi flessibili (es. varianti panetti, personalizzazioni pizze).
    *   **Alembic Compliance:** Tutte le modifiche allo schema del database devono essere gestite rigorosamente tramite script di migrazione autogenerati (`alembic revision --autogenerate`) e revisionati manualmente prima dell'applicazione (`alembic upgrade head`).
2.  **Query Optimization:** 
    *   Sfrutta `selectinload` o `joinedload` di SQLAlchemy per prevenire rigorosamente il problema **N+1**.
    *   Usa indici appropriati (`B-Tree` per ID/Date, `GIN` per campi JSONB).
3.  **Concurrency & Integrity:** 
    *   Implementa **Pessimistic Locking** (`with_for_update()`) per operazioni critiche come la prenotazione tavoli (evitare overbooking) o la gestione stock e-commerce.
    *   Garantisci l'atomicità tramite l'uso corretto di `AsyncSession` e transazioni ACID.

## ⚡ Asincronia & Task Management

1.  **I/O Asincrono:** Ogni operazione di rete o DB deve essere `async`. Usa `psycopg` (v3) asincrono come driver.
2.  **Background Tasks:** 
    *   Per task pesanti (email, generazione PDF ricevute, sync corrieri), utilizza il sistema di background task predisposto. 
    *   Pianifica l'integrazione con Redis/ARQ o Celery se il carico richiede code di messaggi persistenti.

## ⚠️ Gestione Errori & Logging

1.  **Custom Exceptions:** Utilizza la gerarchia in `app/core/exceptions.py`. Ogni errore di dominio deve sollevare un'eccezione specifica.
2.  **Payload Standard:** Gli errori devono essere intercettati dagli exception handler in `main.py` per restituire JSON standardizzati (RFC 7807 style: `{"detail": "..."}`).
3.  **Structured Logging:** Usa `structlog` per tracciare il flusso dei dati. Ogni operazione critica (es. "Order Created", "Booking Confirmed") deve essere loggata con i relativi metadati.

---
*Nota: Queste direttive hanno la precedenza su quelle globali per tutto ciò che riguarda il codice all'interno di `backend/`.*
