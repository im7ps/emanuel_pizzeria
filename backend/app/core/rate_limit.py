from slowapi import Limiter
from slowapi.util import get_remote_address
from app.core.config import settings

# Istanza globale del Limiter
# key_func usa l'IP remoto per identificare il client
# enabled viene letto dai settings per permettere la disattivazione in test/load-test
limiter = Limiter(key_func=get_remote_address, enabled=settings.ENABLE_RATE_LIMIT)
