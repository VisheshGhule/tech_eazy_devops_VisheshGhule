# Assignment 2

1. Im going to use CloudFormation and CLI. (craeting iam role for ec2)
Created IAM Roles:
Role A: Read-only access to the specific S3 bucket.
Role B: Upload-only access (cannot download or list objects).
<img width="1220" height="368" alt="Screenshot from 2025-07-24 14-23-53" src="https://github.com/user-attachments/assets/c8791a32-0938-459f-8be3-abde7a64f649" />

 2. Created a CloudFormation Template:
<img width="1366" height="284" alt="Screenshot from 2025-07-24 14-26-47" src="https://github.com/user-attachments/assets/d462c2ac-6183-4885-9461-43cf07fa1d5d" />
EC2 instance creation (while creating ec2 instance under advance setting select iam role which have created)
<img width="885" height="229" alt="Screenshot from 2025-07-24 14-33-42" src="https://github.com/user-attachments/assets/cf53c48c-d874-4edc-a614-38f438f125cc" />
<img width="1092" height="207" alt="Screenshot from 2025-07-24 14-35-27" src="https://github.com/user-attachments/assets/6d679cf0-44e7-44a0-894e-568f46eea4b0" />
Role attachment (Role B)
<img width="1218" height="644" alt="Screenshot from 2025-07-24 14-43-25" src="https://github.com/user-attachments/assets/c150ef2a-bce9-4460-ad57-e88fa0a3b62e" />
<img width="873" height="94" alt="Screenshot from 2025-07-24 14-50-39" src="https://github.com/user-attachments/assets/43bca652-33b5-411c-b73a-cf16a225ea01" />

 3. S3 bucket creation (private access only)
<img width="1051" height="231" alt="Screenshot from 2025-07-24 14-57-56" src="https://github.com/user-attachments/assets/49b180c8-2a95-43ea-8035-775d930151d1" />
<img width="1061" height="215" alt="Screenshot from 2025-07-24 15-00-03" src="https://github.com/user-attachments/assets/68a52980-e170-4dff-bee5-07a53829ee60" />
<img width="892" height="403" alt="Screenshot from 2025-07-24 15-03-26" src="https://github.com/user-attachments/assets/1018e5f1-2a1d-4119-9bb6-2c9edf7a78c1" />
<img width="735" height="379" alt="Screenshot from 2025-07-24 15-05-31" src="https://github.com/user-attachments/assets/4f849ac0-cfa4-4e3a-987f-55ce027b3109" />
Uploaded EC2 Logs to S3 on Shutdown:
- Wrote a shutdown script to:
- Archive EC2 system logs (e.g., /var/log/cloud-init.log)
- Upload them to a specific S3 folder

<img width="1188" height="159" alt="Screenshot from 2025-07-24 15-06-17" src="https://github.com/user-attachments/assets/fe1625fd-4ba2-4820-be04-d3b78fe75e86" />
<img width="760" height="374" alt="Screenshot from 2025-07-24 15-17-05" src="https://github.com/user-attachments/assets/b5243b60-f74f-4aae-96aa-bec37499cc90" />
<img width="820" height="169" alt="Screenshot from 2025-07-24 15-18-15" src="https://github.com/user-attachments/assets/f95f5a5a-1910-4657-b4bb-4d3b636e897c" />
<img width="976" height="120" alt="Screenshot from 2025-07-24 15-21-33" src="https://github.com/user-attachments/assets/e68c2bbf-6d79-4732-95a9-5030f31fe151" />
<img width="1056" height="408" alt="Screenshot from 2025-07-24 15-23-14" src="https://github.com/user-attachments/assets/42e0cb45-d3f4-43af-b014-a6cd5525e90e" />
We can download logs of ec2
<img width="1066" height="136" alt="Screenshot from 2025-07-24 15-32-15" src="https://github.com/user-attachments/assets/ff7688dd-c5fa-4a50-ae44-b56064ddcd94" />

<img width="1058" height="404" alt="Screenshot from 2025-07-24 15-37-01" src="https://github.com/user-attachments/assets/8636488c-df90-42b3-8385-f789494a14cd" />


---
---
# Assignmet 1
# DevOps EC2 Automation Project

## Objective
Deploy the Spring Boot app on AWS EC2 using Java 21, Maven, and Ubuntu 22.04 with port 80 open — as part of the Techeazy DevOps Assignment.

---

# 1. Create an AWS Account (Free Tier)
- Go to: https://aws.amazon.com
- Sign up and activate a Free Tier account.
- Complete KYC and billing (it asks for a credit/debit card).

---

# 2. EC2 Instance Setup

- I have already have account on AWS so i'm not going create account
- Launched a t2.micro EC2 instance using Ubuntu 22.04 in AWS
- While creating ec2 instance, in security group select inbound port 80 and 22
  <img width="863" height="257" alt="Screenshot from 2025-07-22 16-21-41" src="https://github.com/user-attachments/assets/33d42b88-5074-4727-ba3c-c913eadd6f11" />
- Connected via SSH

---

# 3. Install Java 21 on EC2
After logging into EC2, run:
```bash
sudo apt update
sudo apt install openjdk-21-jdk -y
java -version
```

---

# 4. Also install Maven on EC2
```bash
sudo apt install maven -y
mvn -version
```
<img width="863" height="257" alt="Screenshot from 2025-07-22 16-30-54" src="https://github.com/user-attachments/assets/fc1a736e-e081-4294-b717-445f5fc1a723" />

---

# 5. Clone the GitHub Repo
```bash
git clone https://github.com/techeazy-consulting/techeazy-devops
cd techeazy-devops
```
<img width="880" height="226" alt="Screenshot from 2025-07-22 16-32-12" src="https://github.com/user-attachments/assets/a30d5696-2c6e-4362-9b47-2b5885021faf" />

---

# 6. Build the Project
```bash
mvn clean package
```
<img width="805" height="179" alt="Screenshot from 2025-07-22 16-35-54" src="https://github.com/user-attachments/assets/5aa1c0aa-b960-4bbb-8a6e-418a24d860a5" />

---

# 7. Run the Application
Make sure you run it on port 80 using sudo:
```bash
sudo java -jar target/techeazy-devops-0.0.1-SNAPSHOT.jar
```
OR (you can also use below given command)
```bash
sudo nohup java -jar target/*.jar > log.txt &
```
<img width="978" height="75" alt="Screenshot from 2025-07-22 16-37-35" src="https://github.com/user-attachments/assets/6fa39662-a0ae-404f-a466-afb8d7295303" />

---

# 8. Check the App
Open browser and go to:
```bash
http://<your-ec2-public-ip>
```
<img width="1363" height="115" alt="Screenshot from 2025-07-22 16-37-46" src="https://github.com/user-attachments/assets/d104ed29-8cff-4d94-8e23-d8e5a499b641" />

---

#  9. (Optional) Auto-Stop EC2
If you want to stop EC2 after some time, run:
```bash
sudo shutdown -h +30  # stops instance in 30 minutes
```
<img width="825" height="94" alt="Screenshot from 2025-07-22 17-20-40" src="https://github.com/user-attachments/assets/00fc8fb2-ffa1-4dc3-9395-e0a8161d1474" />
