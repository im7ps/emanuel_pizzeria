# FE/BE Tracking - Emanuel Pizzeria

Questo file traccia la sincronizzazione delle entità e delle rotte tra il Frontend (Flutter) e il Backend (FastAPI).

## 📅 Log delle Entità

| Entità | Stato FE | Stato BE | Note |
| :--- | :--- | :--- | :--- |
| **Booking** | ✅ UI Mock | 🛠️ Da Creare | Gestione prenotazione tavoli |
| **User** | 🛠️ In corso | ✅ Implementato | Autenticazione JWT |
| **Menu** | ✅ UI Implementata | ✅ Implementato | Menu e prodotti |

## 🔗 Log delle Rotte (API v1)

| Feature | Endpoint BE | Route FE | Sincronizzato |
| :--- | :--- | :--- | :--- |
| **Auth** | `/auth/login` | `/login` | ✅ |
| **Bookings** | `/bookings/` | `/bookings` | 🛠️ Solo UI |
| **Menu** | `/catalog/items` | `/menu` | ✅ |

## 🛠️ Specifiche Entità `Booking` (Regole di Validazione)

L'entità `Booking` lato Backend dovrà implementare i seguenti controlli rigorosi:

```python
class Booking(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    
    # Validazione: Solo lettere, spazi e trattino alto "-"
    # Regex: ^[a-zA-Z\s-]+$
    customer_name: str 
    
    # Validazione: Solo numeri (senza spazi o simboli)
    # Regex: ^[0-9]+$
    customer_phone: str 
    
    # Validazione: Min 1, Max 4 (Capacità massima tavolo)
    people_count: int 
    
    booking_date: date
    booking_time: time
    table_index: int  # 0-indexed (0, 1, 2, 3)
    
    status: str = "confirmed"
    created_at: datetime = Field(default_factory=datetime.utcnow)
```

## 📐 Layout Sala (FE Reference)
- **Tavoli Totali:** 4
- **Capacità per Tavolo:** 4 persone
- **ID Tavoli:** 0, 1, 2, 3
