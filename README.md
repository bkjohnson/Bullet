# Overview
This is a Shiny app that creates a bullet graph from a CSV file.  It is modeled after Robert Drennan's bullet graphs in his book Statistics for Archaeologists.

# Demo
For a live demo of the site, visit [bullet.brooksjohnson.me](http://bullet.brooksjohnson.me).

# Development

To run this locally you will need to install [docker](https://www.docker.com/).  Once installed, build the container from the root directory with:

```
docker build -t bullet .
```

Next, you'll need to run the container and make sure that traffic is routed to the correct port.  The following command will allow you to access the app at `localhost:8000`:

```
docker run -p 8000:3838 -it bullet
```
