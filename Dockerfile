FROM rocker/shiny

COPY index.html /srv/shiny-server
COPY shiny /srv/shiny-server/bullet
