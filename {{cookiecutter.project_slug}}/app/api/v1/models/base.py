"""Base models."""

from pydantic import BaseModel


class BaseRequest(BaseModel):
    """DUMMY DOCSTRING."""

    request: str


class BaseResponse(BaseModel):
    """DUMMY DOCSTRING."""

    request: str
    response: str
