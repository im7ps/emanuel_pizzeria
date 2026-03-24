from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
import uuid
from typing import List

from app.database.session import get_session
from app.schemas.example import ExampleCreate, ExampleRead, ExampleUpdate
from app.api.v1.deps import CurrentUser
from app.repositories.example_repo import ExampleRepository
from app.services.example_service import ExampleService

# ==============================================================================
# 🟣 API ROUTER LAYER (HTTP Interface)
# ==============================================================================
# Il Router espone gli endpoint HTTP (GET, POST, PUT, DELETE).
#
# RESPONSABILITÀ:
# 1. Parsing Input: Riceve JSON e lo valida con gli Schema Pydantic.
# 2. Dependency Injection: Ottiene DB Session, User Corrente e Services.
# 3. Delegation: Passa i dati al Service Layer (mai logica qui!).
# 4. Formatting Output: Restituisce i dati filtrati dallo Schema di Response.
# ==============================================================================

router = APIRouter()

# --- Dependency Provider ---
# Costruisce il Service con tutte le sue dipendenze (Repo + Session)
def get_example_service(session: AsyncSession = Depends(get_session)) -> ExampleService:
    repo = ExampleRepository(session)
    return ExampleService(session=session, example_repo=repo)


@router.post("", response_model=ExampleRead)
async def create_example(
    example_data: ExampleCreate,
    current_user: CurrentUser, # Ottiene automaticamente l'utente dal token JWT
    service: ExampleService = Depends(get_example_service) # Inietta il service pronto all'uso
):
    """
    Crea un nuovo esempio.
    """
    return await service.create_example(example_create=example_data, user_id=current_user.id)

@router.get("", response_model=List[ExampleRead])
async def read_examples(
    current_user: CurrentUser,
    service: ExampleService = Depends(get_example_service)
):
    """
    Restituisce la lista degli esempi dell'utente corrente.
    """
    return await service.get_examples_by_user(user_id=current_user.id)

@router.get("/{example_id}", response_model=ExampleRead)
async def read_example(
    example_id: uuid.UUID,
    current_user: CurrentUser,
    service: ExampleService = Depends(get_example_service)
):
    """
    Restituisce un singolo esempio per ID.
    Il service lancerà un errore 404 o 403 se necessario.
    """
    return await service.get_example_by_id(example_id=example_id, user_id=current_user.id)

@router.put("/{example_id}", response_model=ExampleRead)
async def update_example(
    example_id: uuid.UUID,
    example_data: ExampleUpdate,
    current_user: CurrentUser,
    service: ExampleService = Depends(get_example_service)
):
    """
    Aggiorna un esempio esistente.
    """
    return await service.update_example(
        example_id=example_id, example_update=example_data, user_id=current_user.id
    )

@router.delete("/{example_id}", status_code=204)
async def delete_example(
    example_id: uuid.UUID,
    current_user: CurrentUser,
    service: ExampleService = Depends(get_example_service)
):
    """
    Elimina un esempio.
    Status 204 = No Content (successo, corpo vuoto).
    """
    await service.delete_example(example_id=example_id, user_id=current_user.id)
