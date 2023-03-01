# Stage 1: Compile and Build angular codebase
FROM node:lts as build

WORKDIR /app
COPY ./ /app/
RUN npm install
RUN npm run build
#CMD npm run start

# Stage 2: Serve app with nginx
FROM nginx:alpine
COPY --from=build /app/deployment/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/edc-demo-client /usr/share/nginx/html
COPY --from=build /app/src/assets /usr/share/nginx/html/assets
EXPOSE 80

# # Modify the configuration file 
# CMD echo "{\n  \"_comment\": \"This file will be replaced at runtime when deployed to the cloud\",\n  \"dataManagementApiUrl\": \"http://localhost:8182/api/v1/data\",\n  \"catalogUrl\": \"http://localhost:8181/api/federatedcatalog\",\n  \"storageAccount\": \"account\",\n  \"storageExplorerLinkTemplate\": \"storageexplorer://v=1\",\n  \"apiKey\": \"password\",\n  \"theme\": \"theme-1\"\n}" > /usr/share/nginx/html/assets/config/app.config.json
ENV COMMENT="This file will be replaced at runtime when deployed to the cloud"
ENV DATA_MANAGEMENT_URL="http://localhost:8182/api/v1/data"
ENV CATALOG_URL="http://localhost:8181/api/federatedcatalog"

CMD ["/bin/sh",  "-c", "echo '{\n  \"_comment\": \"'$COMMENT'\",\n  \"dataManagementApiUrl\": \"'$DATA_MANAGEMENT_URL'\",\n  \"catalogUrl\": \"'$CATALOG_URL'\",\n  \"storageAccount\": \"account\",\n  \"storageExplorerLinkTemplate\": \"storageexplorer://v=1\",\n  \"apiKey\": \"password\",\n  \"theme\": \"theme-1\"\n}' > /usr/share/nginx/html/assets/config/app.config.json && exec nginx -g 'daemon off;'"]
# HEALTHCHECK --interval=2s --timeout=5s --retries=10 \
#     CMD curl -f http://localhost/ || exit 1
