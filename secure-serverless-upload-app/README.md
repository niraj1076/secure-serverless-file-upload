# 🚀 Secure Serverless File Upload App

A fully serverless web application that allows authenticated users to upload files securely to Amazon S3. Metadata is stored in DynamoDB, and email notifications are sent via SNS.

## 🌐 Live Flow

1. User logs in using AWS Cognito (Authorization Code Grant).
2. File is uploaded to S3 using a pre-signed URL.
3. File metadata is stored in DynamoDB.
4. SNS sends an email notification after upload.

---

## 🧰 Technologies Used

- **AWS Cognito** (User authentication)
- **Amazon S3** (Secure file storage)
- **AWS Lambda** (Backend logic)
- **API Gateway (HTTP API)** (Routing)
- **DynamoDB** (Metadata storage)
- **SNS** (Email notifications)
- **HTML + JavaScript** (Frontend)

---

## 🛠️ Setup Instructions

### 1️⃣ Cognito User Pool (Authentication)

- Go to **Amazon Cognito** → Create **User Pool**
- App Client (no secret)
- Enable **Authorization Code Grant**
- Scopes: `email`, `openid`, `profile`
- Callback URL: `http://localhost:5500`
- Set custom domain (e.g., `https://<your-domain>.auth.ap-south-1.amazoncognito.com`)

### 2️⃣ Lambda Functions (Business Logic)

Create 3 Lambda functions:

| Function | Purpose | Required Permissions |
|---------|---------|-----------------------|
| `getUploadUrlHandler` | Generates pre-signed S3 URL | `s3:PutObject` |
| `logMetadataHandler` | Logs file metadata to DynamoDB | `dynamodb:PutItem` |
| `sendEmailHandler` | Sends notification via SNS | `sns:Publish` |

### 3️⃣ API Gateway (HTTP API)

- Create an **HTTP API**
- Add 3 routes:
  - `POST /upload` → `getUploadUrlHandler`
  - `POST /log` → `logMetadataHandler`
  - `POST /notify` → `sendEmailHandler`
- Enable **CORS** for:
  - Origin: `http://localhost:5500`
  - Headers: `Authorization`, `Content-Type`
  - Methods: `POST`

### 4️⃣ DynamoDB (Metadata Storage)

- Create table: `FileLogs`
- Partition key: `fileID` (String)
- Billing mode: On-demand (for testing)

### 5️⃣ S3 Bucket (File Storage)

- Bucket name: `secure-file-uploads-<unique-suffix>`
- Keep it **private**
- No special policy needed (uses pre-signed URL)
- (Optional) Enable encryption and versioning

### 6️⃣ SNS Topic (Notifications)

- Create topic: `SecureFileUploadTopic`
- Add **email subscription**
- Confirm the subscription via email

---

## 🖥️ Frontend Setup

1. Files required:
   - `index.html`
   - `upload.js`

2. Serve via **Live Server** in VS Code:
   - Right-click `index.html` → Open with Live Server

3. App Flow:
   - User logs in via Cognito
   - Token used to authorize API calls
   - File uploaded to S3 via pre-signed URL
   - Metadata stored in DynamoDB
   - Notification sent via SNS

---

## ✅ Prerequisites

- AWS Account with sufficient permissions
- Cognito domain configured
- IAM roles for Lambda with correct policies
- Live Server (VS Code extension)

---

## 📂 Folder Structure

secure-serverless-upload-app/
├── index.html
├── upload.js
├── lambda/
│ ├── getUploadUrlHandler.py
│ ├── logMetadataHandler.py
│ └── sendEmailHandler.py
└── README.md

yaml
Copy
Edit

---

## 📢 Notes

- Always pass `Authorization: <id_token>` in API calls
- If CORS or token issues arise, check browser console
- Ensure `redirect_uri` matches in Cognito and frontend exactly

---

## 🧪 Test Your Setup

- Open `http://localhost:5500`
- Click **Login**
- Choose a file and upload
- Check:
  - S3 → File exists
  - DynamoDB → Metadata stored
  - Email → SNS notification received

---

## 📧 Author

Built by Niraj Shrivastav — AWS | DevOps | Cloud Projects  
For feedback or questions: [LinkedIn](https://www.linkedin.com/)