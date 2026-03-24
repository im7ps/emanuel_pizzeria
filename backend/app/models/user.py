import uuid
from sqlmodel import SQLModel, Field, Relationship
from typing import Optional, List, TYPE_CHECKING
from datetime import datetime
from sqlalchemy import func
from app.models.utils import get_utc_now

if TYPE_CHECKING:
    from app.models.example import Example

# --- UTENTE ---
class User(SQLModel, table=True):
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True, index=True)
    username: str = Field(unique=True, index=True)
    email: str = Field(unique=True)
    hashed_password: str
    is_active: bool = Field(default=True)
    created_at: datetime = Field(default_factory=get_utc_now)
    updated_at: Optional[datetime] = Field(
        default=None, 
        sa_column_kwargs={"onupdate": func.now()}
    )

    examples: List["Example"] = Relationship(back_populates="user")
