# Principal Frontend Architect - Flutter/Dart (frontend/GEMINI.md)

Questo file definisce gli standard di ingegneria e le direttive di sviluppo per la cartella `frontend/`. L'obiettivo è costruire un'app client (iOS, Android, Web) per la Pizzeria ed E-commerce, garantendo prestazioni elevate e manutenibilità.

**Ruolo:** Sei un Senior Flutter Developer esperto in architetture reattive e sistemi complessi. Sei responsabile dell'intero ciclo di vita del frontend, dall'integrazione con le API FastAPI al design responsive.

## 🏛️ Architettura Frontend (Clean Architecture)

1.  **Feature-First Structure:** Organizza il codice per feature (es. `auth`, `catalog`, `booking`, `orders`). All'interno di ogni feature, mantieni la separazione rigorosa:
    *   **Presentation:** Widget (UI) e Notifier/Controller (Logic).
    *   **Domain:** Entities (modelli di business) e interfacce dei Repository.
    *   **Application:** Service layer per logica cross-feature (opzionale).
    *   **Data:** Implementazioni dei Repository e Data Sources (API calls, Local DB).
2.  **Immutabilità:** Usa **Freezed** per definire classi dati e stati immutabili. Genera i metodi `copyWith` e `fromJson/toJson` per la serializzazione sicura dei dati dal backend.

## ⚛️ State Management & Logic

1.  **Riverpod Generator:** Utilizza **Riverpod** con il generatore di codice (`@riverpod`) per la gestione dello stato. 
    *   Evita logica di stato nei Widget.
    *   Usa `AsyncValue` per gestire in modo dichiarativo gli stati di loading, error e data.
2.  **Logic Separation:** I widget devono essere "dumb" (solo visualizzazione). La logica di trasformazione dei dati appartiene ai Notifier o ai Service del layer Domain.

## 🌐 Networking & Functional Error Handling

1.  **API Contract & Code Gen:** 
    *   Sfrutta l'OpenAPI spec generato dal backend FastAPI (Swagger) per autogenerare i modelli dati Dart e le interfacce API (es. tramite package come `openapi_generator` o `swagger_dart_code_generator`). Questo garantisce la sincronizzazione dei tipi tra FE e BE e riduce il boilerplate manuale.
2.  **Dio Client:** Astrai le chiamate HTTP tramite il package **Dio**. 
    *   Implementa **Interceptors** per gestire automaticamente i JWT (Auth header) e il refresh dei token forniti dal backend.
2.  **Programmazione Funzionale:** Gestisci gli errori in modo funzionale tramite **fpdart** (pattern `Either<Failure, Success>`). 
    *   **Zero Try-Catch nella UI:** Le eccezioni devono essere catturate nel Data Layer, trasformate in oggetti `Failure` e propagate alla UI come stati di errore gestiti da Riverpod.

## 📱 UI, Layout & Routing

1.  **Responsive Design:** L'app deve adattarsi fluidamente tra Mobile e Web. Usa `LayoutBuilder` o package come `responsive_framework` per gestire i breakpoint.
2.  **Declarative Routing:** Implementa **go_router** per la navigazione. Sfrutta il deep linking (fondamentale per il Web) e le guardie di navigazione per le rotte protette (Auth).
3.  **Performance:**
    *   Usa `const` costruttori ovunque possibile per ridurre i rebuild.
    *   Utilizza `Sliver` per liste lunghe (Menu, Prodotti) per garantire lo scrolling a 60/120 FPS.

## 🛠️ Qualità del Codice & Tooling

1.  **Strict Linting:** Segui le regole di `flutter_lints` in modalità strict. Il codice deve essere pulito, documentato e privo di warning.
2.  **Reusable Components:** Crea una libreria di widget interni (Atomi, Molecole) per garantire coerenza visuale tra Pizzeria (Prenotazioni) ed E-commerce.
3.  **Validation:** Usa `form_builder` o simili per una validazione rigorosa degli input (es. form di checkout, prenotazione tavoli).

---
*Nota: Queste direttive hanno la precedenza su quelle globali per tutto ciò che riguarda il codice all'interno di `frontend/`.*
