from typing import List
import uuid
from sqlalchemy.ext.asyncio import AsyncSession
from sqlmodel import select

from app.models.example import Example
from app.schemas.example import ExampleCreate, ExampleUpdate
from app.repositories.base_repo import BaseRepository

# ==============================================================================
# 🟩 REPOSITORY LAYER (Data Access)
# ==============================================================================
# Il Repository è l'UNICO punto di accesso al Database.
# Isola la logica SQL dal resto dell'applicazione.
#
# Ereditando da BaseRepository[Model, CreateSchema, UpdateSchema], otteniamo GRATIS:
# - get(id)
# - create(schema)
# - update(model, schema)
# - delete(model)
#
# Qui aggiungiamo solo le query specifiche per "Example" (es. filtrare per utente).
# ==============================================================================

class ExampleRepository(BaseRepository[Example, ExampleCreate, ExampleUpdate]):
    def __init__(self, session: AsyncSession):
        super().__init__(Example, session)

    async def get_by_user(self, user_id: uuid.UUID) -> List[Example]:
        """
        Recupera tutti gli esempi appartenenti a uno specifico utente.
        Query Custom non presente nel BaseRepository.
        """
        statement = select(self.model).where(self.model.user_id == user_id)
        result = await self.session.execute(statement)
        return list(result.scalars().all())