# Traefik Reverse Proxy Setup  
  
1. Copy example config.  
  
    ```  
    $ cp docker-compose.example.yml docker-compose.yml  
    $ cp conf/traefik.example.toml conf/traefik.toml  
    ```  
  
2. Edit docker-compose.yml  
  
- Replace `{{YOUR_HOST_DOMAIN}}` to your DNS A record.  
  
3. Edit conf/traefik.toml   
  
- Replace `{{YOUR_CONTACT_EMAIL}}` to your main email. (for register Let's Encrypt certificate)  
  
- Setting dashboard BasicAuth users (you can execute GenerateBasicAuthForUser.sh), or comment the BasicAuth block (not security).  
  
4. Execute the shell script.  
  
    ```  
    # for Let's Encrypt certificate store  
    $ sh InitialCertificate.sh  
      
    # for docker-compose network share with traefik or another services.  
    $ sudo sh InitialTraefikReverseProxyNetwork.sh  
    ```  
  
5. Startup traefik service.  
  
    ```  
    $ docker-compose up -d  
    ```  
