import uuid
from typing import List
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.example import Example
from app.repositories.example_repo import ExampleRepository
from app.schemas.example import ExampleCreate, ExampleUpdate
from app.core.exceptions import ResourceNotFound, ForbiddenAction

# ==============================================================================
# 🟧 SERVICE LAYER (Business Logic)
# ==============================================================================
# Il Service contiene la logica "intelligente" dell'applicazione.
#
# RESPONSABILITÀ:
# 1. Permission Checks: L'utente PUÒ fare questa azione? (es. modificare solo i propri dati)
# 2. Transaction Management: Commit / Rollback delle modifiche.
# 3. Validation: Controlli logici complessi (es. "non puoi creare un esempio se ne hai già 10").
# 4. Orchestration: Chiama il Repository per leggere/scrivere.
# ==============================================================================

class ExampleService:
    def __init__(self, session: AsyncSession, example_repo: ExampleRepository):
        self.session = session
        self.example_repo = example_repo

    async def create_example(self, example_create: ExampleCreate, user_id: uuid.UUID) -> Example:
        """Crea un nuovo esempio associato all'utente corrente."""
        # Qui potremmo aggiungere logica extra (es. check quota utente)
        
        # Passiamo user_id come parametro extra al metodo create del BaseRepo
        new_example = await self.example_repo.create(example_create, user_id=user_id)
        await self.session.commit()
        return new_example

    async def get_examples_by_user(self, user_id: uuid.UUID) -> List[Example]:
        """Recupera la lista di esempi dell'utente."""
        return await self.example_repo.get_by_user(user_id)

    async def get_example_by_id(self, example_id: uuid.UUID, user_id: uuid.UUID) -> Example:
        """
        Recupera un singolo esempio, verificando che esista e appartenga all'utente.
        Lancia eccezioni di dominio se le condizioni non sono soddisfatte.
        """
        example = await self.example_repo.get(example_id)
        
        if not example:
            raise ResourceNotFound("Example not found")
        
        # Security Check: Assicura che l'utente acceda solo ai propri dati
        if example.user_id != user_id:
            raise ForbiddenAction("You do not have permission to access this resource")
            
        return example

    async def update_example(
        self, example_id: uuid.UUID, example_update: ExampleUpdate, user_id: uuid.UUID
    ) -> Example:
        """Aggiorna un esempio esistente."""
        # 1. Recupera e verifica permessi (riutilizza il metodo sopra per DRY)
        example = await self.get_example_by_id(example_id, user_id)
        
        # 2. Aggiorna
        updated_example = await self.example_repo.update(example, example_update)
        
        # 3. Commit
        await self.session.commit()
        return updated_example

    async def delete_example(self, example_id: uuid.UUID, user_id: uuid.UUID) -> None:
        """Elimina un esempio."""
        example = await self.get_example_by_id(example_id, user_id)
        await self.example_repo.delete(example)
        await self.session.commit()