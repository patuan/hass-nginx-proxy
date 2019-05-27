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
  - Edit the Default.conf file (inside the conf.d directory), change the domain name and the local address of the server.
   
