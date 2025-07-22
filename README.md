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
  <img width="863" height="257" alt="Screenshot from 2025-07-22 16-21-41" src="https://github.com/user-attachments/assets/d9691838-aefa-4ebe-9398-4144bac85d29" />
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
<img width="863" height="257" alt="Screenshot from 2025-07-22 16-30-54" src="https://github.com/user-attachments/assets/8e7512f7-0502-4010-804a-76a4e0c0482f" />

---

# 5. Clone the GitHub Repo
```bash
git clone https://github.com/techeazy-consulting/techeazy-devops
cd techeazy-devops
```
<img width="880" height="226" alt="Screenshot from 2025-07-22 16-32-12" src="https://github.com/user-attachments/assets/60590756-f2ff-4032-8919-999c353dc7bd" />


---

# 6. Build the Project
```bash
mvn clean package
```
<img width="805" height="179" alt="Screenshot from 2025-07-22 16-35-54" src="https://github.com/user-attachments/assets/ed46b2af-a543-46ff-b19d-53dae0011962" />


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
<img width="978" height="75" alt="Screenshot from 2025-07-22 16-37-35" src="https://github.com/user-attachments/assets/b26f1834-712c-4b1d-b5e5-6ef68c94d3c5" />

---

# 8. Check the App
Open browser and go to:
```bash
http://<your-ec2-public-ip>
```
<img width="1363" height="115" alt="Screenshot from 2025-07-22 16-37-46" src="https://github.com/user-attachments/assets/96a1dcb5-3432-4516-80c9-15a355b402b3" />

---

#  9. (Optional) Auto-Stop EC2
If you want to stop EC2 after some time, run:
```bash
sudo shutdown -h +30  # stops instance in 30 minutes
```
<img width="825" height="94" alt="Screenshot from 2025-07-22 17-20-40" src="https://github.com/user-attachments/assets/24c6648f-69ff-4c0a-b654-915932461d4e" />
