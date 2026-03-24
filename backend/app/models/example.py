from typing import Optional
import uuid
from sqlmodel import Field, Relationship
from .base import TunableBaseModel

# ==============================================================================
# 🟦 DATA MODEL LAYER (SQLModel)
# ==============================================================================
# Questo file definisce la struttura della tabella nel database.
# Eredita da TunableBaseModel (che include id UUID, created_at, updated_at).
#
# RULES:
# 1. table=True: Indica a SQLModel di creare una tabella DB per questa classe.
# 2. Field(...): Definisce colonne e vincoli (index, foreign keys, nullable).
# 3. Relationship(...): Definisce le relazioni ORM (non crea colonne DB, ma link logici).
# ==============================================================================

class Example(TunableBaseModel, table=True):
    # Campi Dati
    name: str = Field(index=True)  # Indice per ricerche veloci
    description: Optional[str] = Field(default=None)
    
    # Foreign Key: Collega fisicamente questo record a un utente
    user_id: uuid.UUID = Field(foreign_key="user.id", nullable=False)

    # Relazione ORM: Permette di accedere all'oggetto User collegato (es. my_example.user)
    # back_populates deve corrispondere al campo definito nel modello User
    user: "User" = Relationship(back_populates="examples")