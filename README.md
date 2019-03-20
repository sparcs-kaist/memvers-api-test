# Docker-compose for Memvers API test server
### Management of Electronic Mail via Visualized Editor and Registration for SPARCS
* 본 docker-compose는 Memvers API의 테스트 및 개발 서버 세팅을 위한 것으로, 절대로 실 서비스를 위해 사용하지 마십시오.
## How to use
```shell
git clone https://github.com/sparcs-kaist/memvers-api-test.git
cd memvers-api-test
sudo docker-compose up

# 출력되는 log를 확인하여 MySQL, mongoDB, LDAP 서버가 모두 정상적으로 작동할 때까지 기다립니다.

/bin/bash set.sh

# (`set.sh`를 통하여 LDAP에 People 그룹, wheel 계정을 추가하고, MySQL에 nugu 데이터베이스를 추가합니다.)

docker exec -it memvers-api-server /bin/bash

# 위 명령을 통하여 memvers-api-server 컨테이너에 들어간 뒤,

npm run dev
```
* Insomnia 등의 tool을 사용하여 HTTP 요청을 보내 테스트할 수 있습니다.
## Etc
* 처음 세팅 시 wheel 계정 이외의 어떤 계정도 존재하지 않습니다.
* wheel 계정의 비밀번호는 wheel입니다.
* LDAP admin 계정의 비밀번호는 admin입니다.
* MySQL root 계정의 비밀번호는 root입니다.
* 본 서버는 실 SPARCS 서버와는 완전히 분리되어 있으므로 안전하게 테스트 할 수 있습니다.
* /reset에 보낸 PUT 요청의 결과 발송되는 메일은 모두 /var/mail/root에 저장됩니다.
## External links
* API: https://github.com/sparcs-kaist/memvers-api
* Front: https://github.com/sparcs-kaist/memvers-front
