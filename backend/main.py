from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from models import Base, Audit, Defect
from pydantic import BaseModel
from typing import List, Optional
import uuid

# 1. Database Connection
DATABASE_URL = "postgresql://admin:password123@localhost:5432/ironsync_db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Create Tables (Quick & Dirty way - for migrations use Alembic later)
Base.metadata.create_all(bind=engine)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins (React, Mobile, etc.)
    allow_credentials=True,
    allow_methods=["*"],  # Allows GET, POST, PUT, DELETE
    allow_headers=["*"],
)

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# 2. Pydantic Schemas (Data Validation)
class DefectCreate(BaseModel):
    description: str
    severity: str

class AuditCreate(BaseModel):
    title: str
    inspector_id: str
    site_location: str
    defects: List[DefectCreate] = []

# 3. API Endpoints
@app.post("/audits/")
def create_audit(audit_data: AuditCreate, db: Session = Depends(get_db)):
    # Create the Audit
    new_audit = Audit(
        title=audit_data.title,
        inspector_id=audit_data.inspector_id,
        site_location=audit_data.site_location
    )
    db.add(new_audit)
    db.commit()
    db.refresh(new_audit)

    # Create associated Defects
    for defect in audit_data.defects:
        new_defect = Defect(
            audit_id=new_audit.id,
            description=defect.description,
            severity=defect.severity
        )
        db.add(new_defect)
    
    db.commit()
    return {"status": "success", "audit_id": new_audit.id}

@app.get("/audits/")
def read_audits(db: Session = Depends(get_db)):
    return db.query(Audit).all()

# ... (Previous imports)

# 1. Add this Pydantic Model for receiving data
# --- UPDATE THIS SECTION ---

class AuditSchema(BaseModel):
    title: str
    inspector_id: str
    site_location: str
    created_at: str

@app.post("/sync/upload")
def upload_audit(audit_data: AuditSchema, db: Session = Depends(get_db)):
    print(f"📥 RECEIVED: {audit_data.title} from {audit_data.inspector_id}")
    
    # 1. Create the Database Record
    new_audit = Audit(
        title=audit_data.title,
        inspector_id=audit_data.inspector_id,
        site_location=audit_data.site_location
    )
    
    # 2. Add to Transaction
    db.add(new_audit)
    
    # 3. Commit (Save) to Disk
    db.commit()
    db.refresh(new_audit)
    
    print(f"✅ SAVED to DB with ID: {new_audit.id}")

    return {"status": "received", "id": str(new_audit.id)}