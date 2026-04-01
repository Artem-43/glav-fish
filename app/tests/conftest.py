import os
import sys
import pytest
from datetime import date

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

# ✅ задаём test DB ДО import app
os.environ["DATABASE_URL"] = "sqlite:///:memory:"

from app import app, db
from models import Boat


@pytest.fixture
def client():
    app.config["TESTING"] = True

    with app.app_context():
        db.drop_all()
        db.create_all()

        with app.test_client() as client:
            yield client

        db.session.remove()
        db.drop_all()


@pytest.fixture
def test_boat():
    with app.app_context():
        boat = Boat(
            name="TestBoat",
            boat_type="TestType",
            displacement=100.0,
            build_date=date(2023, 1, 1)
        )
        db.session.add(boat)
        db.session.commit()
        return boat.id
