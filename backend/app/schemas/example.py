import uuid
from typing import Optional
from sqlmodel import SQLModel
from datetime import datetime

# ==============================================================================
# 🟨 SCHEMA LAYER (Pydantic / DTOs)
# ==============================================================================
# Questi file definiscono COSA entra e COSA esce dalle API.
# Separare gli schemi (Create, Update, Read) è cruciale per la sicurezza e la chiarezza.
#
# RULES:
# 1. Input Validation: Usa i tipi Python (str, int) e Field(...) per validare i dati in ingresso.
# 2. Output Filtering: Definisce esattamente cosa il client può vedere (nasconde campi sensibili).
# ==============================================================================

# --- INPUT SCHEMAS ---

class ExampleCreate(SQLModel):
    """
    Dati richiesti per creare un nuovo esempio.
    L'ID e user_id non sono qui perché vengono gestiti dal backend.
    """
    name: str
    description: Optional[str] = None


class ExampleUpdate(SQLModel):
    """
    Dati opzionali per aggiornare un esempio esistente.
    Tutti i campi sono Optional perché l'utente potrebbe volerne aggiornare solo uno.
    """
    name: Optional[str] = None
    description: Optional[str] = None


# --- OUTPUT SCHEMAS ---

class ExampleRead(SQLModel):
    """
    Ciò che restituiamo al client.
    Include ID, timestamp e dati, ma NON dati sensibili o relazioni pesanti non richieste.
    """
    id: uuid.UUID
    name: str
    description: Optional[str] = None
    created_at: datetime
    updated_at: datetime
    # user_id: uuid.UUID # Decommentare se si vuole esporre l'ID dell'owner
