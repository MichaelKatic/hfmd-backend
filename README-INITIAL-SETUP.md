# How This Repo Was Created
## Create strapi backend

1. npx create-strapi-app@latest my-app-name --quickstart
1. add admin user via url: http://localhost:1337/admin/auth/register-admin
1. add file .vscode/launch.json with contents:
    ```
    {
        "configurations": [
            {
                "command": "npx strapi develop",
                "name": "strapi develop",
                "request": "launch",
                "type": "node-terminal"
            }
        ]

    }
    ```
1. Install plugins
	npm install strapi-plugin-react-editorjs
	npm run strapi install graphql

1. Other possibly usefule plugins:
    - https://market.strapi.io/plugins/strapi-google-auth
    - https://market.strapi.io/plugins/@chartbrew-plugin-strapi
    - View all http://localhost:1337/admin/marketplace

1. Set up API token: http://localhost:1337/admin/settings/api-tokens/
1. deployment guide: https://docs.strapi.io/developer-docs/latest/setup-deployment-guides/deployment.html
1. Access graphql ui here: http://localhost:1337/graphql
	example queries here: https://docs.strapi.io/developer-docs/latest/developer-resources/database-apis-reference/graphql-api.html#fetch-a-single-entry

## create react frontend

 