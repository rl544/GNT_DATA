from fastapi import APIRouter
from ..database.database import *
from ..models.user_meta import *
import pandas as pd
import numpy as np
import pickle
from pydantic import BaseModel

router = APIRouter()

@router.get('/recommend', tags=["Recommend"])
def rec_size():
    donation_list = get_donation_list()
    print(donation_list)
    return donation_list