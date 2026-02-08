# secure-serverless-file-upload
This a project to upload file without human intervevtion.

# Secure Serverless File Upload – Phase 1

A fully serverless AWS application that allows authenticated users to securely upload files to S3 using pre-signed URLs.

## Architecture
- AWS Cognito – Authentication
- API Gateway – HTTP APIs
- AWS Lambda – Backend logic
- Amazon S3 – Secure file storage
- DynamoDB – Metadata storage
- SNS – Email notifications

## Phase 1 Features
- Authenticated file uploads
- Private S3 bucket
- Metadata logging
- Email notification on upload

## Next Phase
Infrastructure automation using Terraform.
