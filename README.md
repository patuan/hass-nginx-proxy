# Home Assistant with NGINX reverse Proxy installation

[![Smatec](https://smatec.com.vn/wp-content/uploads/2019/04/smatect-logo.png)](http:/homeon.vn)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Setup Home-assistant via Docker with nginx reverse proxy (support SSL with LetsEncrypt)

  - Type some Markdown on the left
  - See HTML in the right
  - Magic

# Install HASS
  - Install directly via Python  --- *OR* ---
  - Install via Docker: the NETWORK MODE must be set to HOST for DISCOVERY functions work properly in HASS.
    
# Install NGINX PROXY for LetsEncrypt
  - Install via docker-compose
  
# Install NGINX PROXY for HASS
  - Install this as a proxy between NGINX PROXY for LetsEnrypt and HASS, because HASS run on Host Network, so the NGINX PROXY for LetsEncrypt can not create proxy directly to HASS
  - Set the domain properly in docker-compose file, ex: ha.xxxxx.duckdns.org
  - Edit the Default.conf file (inside the conf.d directory), change the domain name and the local address of the PI.
   
# Install Duckdns for Dynamic Domain name
  - Install via docker-compose

# Install homeOn-mqtt
  - Install via docker-compose: 
  - Change Environment variables:
    - SHUID=xxxxxxxxxxxxxxx (ID of the SHU)
    - UDP_PASSWORD=admin
    - UDP_CONNECTION_IP=192.168.1.32 (Local IP Adress of the SHU)
    - UDP_CONNECTION_PORT=5667 (Local UDP port of the SHU)        
    - HOME_ASSISTANT_AUTO_GENERATE_CONFIG=true (Automatic generate HASS config file for homeon-mqtt, must be true at the first run, then can set to false and restart)
    - HOME_ASSISTANTE_GENERATE_SCRIPT=false (create hass's switch to control homeon's scripts activate)
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
