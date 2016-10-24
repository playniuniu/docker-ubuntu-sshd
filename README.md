# Docker for ubuntu sshd

### Prepare

Copy your id_rsa.pub to Your_Data_Folder/ssh/id_rsa.pub

### Run

```bash
docker run -d -p 2222:22 -v Your_Data_Folder/:/data/ --name ubuntu-sshd playniuniu/ubuntu-sshd
```
