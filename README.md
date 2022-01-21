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
  
  > if htpasswd not found, you can execute this command to install it. `sudo apt-get install apache2-utils`
  
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
  
# Check certificate & deploy traefik service  

1. If your certificate have been generated and setting are correct, then initial your staging certificate.

    ```  
    # for Let's Encrypt certificate reset  
    $ sh InitialCertificate.sh  
    ```  
  
2. Edit conf/traefik.toml  
  
- Remove word `-staging` in `caServer` url.  
  
3. Restart your traefik service.
  
    ```  
    $ docker-compose restart
    ```  
  
# Deploy other services using docker-compose  
  
1. Add the service to networks same as traefik. 
  
    ```  
    networks:
      TraefikReverseProxy:
        driver: bridge
        external: true
    ```  
  
2. Add the service labels for traefik identify, then done !!
  
    ```  
    labels:
      - "traefik.enable=true"
      - "traefik.port=15672"
      - "traefik.frontend.rule=Host:rabbitmq.example.com"
      - "traefik.frontend.entryPoints=http,https"
      - "traefik.frontend.passHostHeader=true"
    ```  
