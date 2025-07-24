# Assignment 2



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
