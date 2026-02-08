# 🚀 Secure Serverless File Upload App (Phase 1)

A fully serverless AWS application that allows **authenticated users** to securely upload files to Amazon S3 using **pre-signed URLs**.  
File metadata is stored in DynamoDB, and email notifications are sent via SNS.

This project is designed with **security, scalability, and automation** in mind and follows real-world cloud architecture practices.

---

## 🧩 Architecture Overview

### Upload Flow
1. User authenticates using **AWS Cognito**
2. Frontend requests a **pre-signed URL** from backend
3. File is uploaded securely to **private S3 bucket**
4. File metadata is stored in **DynamoDB**
5. **SNS** sends an email notification after upload

---

## 🧰 Technologies Used

- **AWS Cognito** – User authentication
- **Amazon S3** – Secure file storage
- **AWS Lambda** – Backend business logic
- **API Gateway (HTTP API)** – API routing
- **Amazon DynamoDB** – Metadata storage
- **Amazon SNS** – Email notifications
- **HTML & JavaScript** – Frontend

---

## 📂 Project File Structure
```

secure-serverless-file-upload/
│
├── frontend/
│ ├── index.html # UI for login and file upload
│ └── upload.js # Handles authentication, API calls, and upload logic
│
├── lambda/
│ ├── getUploadUrlHandler.py # Generates pre-signed S3 upload URL
│ ├── logMetadataHandler.py # Stores file metadata in DynamoDB
│ └── sendEmailHandler.py # Publishes upload notification to SNS
│
├── docs/
│ └── architecture.md # Architecture explanation & diagrams (optional)
│
├── terraform/
│ └── phase-2-iac/ # Terraform code (to be added in Phase 2)
│
├── .gitignore # Prevents sensitive and unwanted files
├── README.md # Project documentation
└── LICENSE


```

## 🔐 Security Highlights

- No public access to S3 bucket
- Uploads handled via **pre-signed URLs**
- Authentication enforced using **Cognito**
- IAM roles with **least-privilege permissions**
- No hard-coded AWS credentials

---

## 📈 Cloud Design Pillars

- **Security** – Cognito, IAM, private S3
- **Scalability** – Lambda, API Gateway, DynamoDB on-demand
- **High Availability** – Fully managed AWS services
- **Cost Optimization** – Pay-per-use, no EC2
- **Automation Ready** – Designed for Terraform (Phase 2)

---

## 🧪 How to Run (Local Frontend)

1. Open `index.html` using **Live Server** (VS Code)
2. Login via Cognito
3. Select a file and upload
4. Verify:
   - File in S3
   - Metadata in DynamoDB
   - Email received from SNS

---

## 📌 Phase Status

✅ **Phase 1 Completed**  
- Secure serverless upload  
- Authentication  
- Metadata logging  
- Email notification  

🚧 **Phase 2 (Next)**  
- Infrastructure as Code using **Terraform**
- Automated create & destroy
- IAM permission management

---

## 👨‍💻 Author

**Niraj Rajput**  
AWS | Cloud | DevOps Projects  

---

⭐ If you find this project useful, give it a star!