# Home Assistant with NGINX reverse Proxy installation

[![Smatec](https://smatec.com.vn/wp-content/uploads/2019/04/smatect-logo.png)](http:/homeon.vn)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Setup Home-assistant via Docker with nginx reverse proxy (support SSL with LetsEncrypt)


# Install HASS
  - Install via docker-compose:
  ```
  sudo docker-compose up -d
  ```
    
# Install NGINX PROXY for LetsEncrypt
  - Install via docker-compose:
  ```
  sudo docker-compose up -d
  ```
  
# Install NGINX PROXY for HASS
### Install this as a proxy between NGINX PROXY for LetsEnrypt and HASS, because HASS run on Host Network, so the NGINX PROXY for LetsEncrypt can not create proxy directly to HASS
  - Install via docker-compose, set the domain properly in docker-compose file, ex: ha.xxxx.duckdns.org:
  ```
  environment:
      #change xxxx to the Duckdns domain name
      #change your email to receive LetsEncrypt Notifications
      - VIRTUAL_HOST=ha.xxxx.duckdns.org
      - VIRTUAL_PORT=80
      - LETSENCRYPT_HOST=ha.xxxx.duckdns.org
      - LETSENCRYPT_EMAIL=youremail@gmail.com
  ```
  ```
  sudo docker-compose up -d
  ```
  - Edit the Default.conf file (config/default.conf), change the domain name and the local address of the PI.
  ```
  access_log off;
  #change the 192.168.11.1 to the IP of the Router
  resolver 192.168.11.1 0.0.0.0;
  # HTTP 1.1 support
  ```
  ```
  # ha.xxxx.duckdns.org, change the xxxx to the Duckdns Domain name
  upstream ha.xxxx.duckdns.org {
          ## Can be connected with "bridge" network
        # hass-nginx, change 192.168.11.3 to the LOCAL IP ADDRESS of the HOST
        server 192.168.11.3:8123;
  }
  server {
    server_name ha.xxxx.duckdns.org;
    listen 80 ;
    access_log /var/log/nginx/access.log vhost;
    #include /etc/nginx/vhost.d/default;
          location / {
                  proxy_pass http://ha.xxxx.duckdns.org;
          }
  }
  ```
  ```
  docker restart nginx-for-hass
  ```
  
# Install Duckdns for Dynamic Domain name
  - Install via docker-compose, set the duckdns info in the docker-compose.yaml file:
  ```
  environment:
      #- PUID=1000 #optional
      #- PGID=1000 #optional
      - TZ=Europe/London
      # Your subdomain name of DuckDns
      - SUBDOMAINS=xxxx
      - TOKEN=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
  ```
  ```
  sudo docker-compose up -d
  ```

# Install homeOn-mqtt
  - Install via docker-compose, change Environment variables in the docker-compose.yaml file:
  ```
    - SHUID=xxxxxxxxxxxxxxx (ID of the SHU)
    - UDP_PASSWORD=admin
    - UDP_CONNECTION_IP=192.168.1.32 (Local IP Adress of the SHU)
    - UDP_CONNECTION_PORT=5667 (Local UDP port of the SHU)        
    - HOME_ASSISTANT_AUTO_GENERATE_CONFIG=true (Automatic generate HASS config file for homeon-mqtt, must be true at the first run, then can set to false and restart)
    - HOME_ASSISTANTE_GENERATE_SCRIPT=false (create hass's switch to control homeon's scripts activate)
  ```
  ```
  volumes:
      #Change path to the configuration directory of the Hass:
      - path_to_hass_configuration:/config 
  ```
  ```
  sudo docker-compose up -d
  ```
  - Change the configuration.yaml of Hass (/hass/config):
    - Change customization: 
        ```
        customize: !include_dir_merge_named customize
        ```
    - Change group, light, switch ,...:
        ```
        group: !include_dir_merge_named group
        switch: !include_dir_merge_list switch
        sensor: !include_dir_merge_list sensor
        binary_sensor: !include_dir_merge_list binary_sensor
        cover: !include_dir_merge_list cover
        climate: !include_dir_merge_list climate
        fan: !include_dir_merge_list fan
        light: !include_dir_merge_list light
        ```
    - Set Mqtt connection:
        ```
        mqtt:
          broker: 127.0.0.1
          port: 1883
        ```
    - Restart hass 
