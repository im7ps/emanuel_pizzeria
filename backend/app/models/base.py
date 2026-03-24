import uuid
from typing import Optional
from datetime import datetime
from sqlmodel import SQLModel, Field, func
from app.models.utils import get_utc_now

class TunableBaseModel(SQLModel):
    """
    Base Model per le tabelle del Database.
    Include ID (UUID), Created_At e Updated_At automatici.
    """
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True, index=True)
    created_at: datetime = Field(default_factory=get_utc_now)
    updated_at: Optional[datetime] = Field(
        default=None, 
        sa_column_kwargs={"onupdate": func.now()}
    )
