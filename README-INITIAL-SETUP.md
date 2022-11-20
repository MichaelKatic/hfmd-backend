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

1. Other possibly useful plugins:
    - https://market.strapi.io/plugins/strapi-google-auth
    - https://market.strapi.io/plugins/@chartbrew-plugin-strapi
    - View all http://localhost:1337/admin/marketplace

1. Set up API token: http://localhost:1337/admin/settings/api-tokens/
1. deployment guide: https://docs.strapi.io/developer-docs/latest/setup-deployment-guides/deployment.html
1. Access graphql ui here: http://localhost:1337/graphql
	example queries here: https://docs.strapi.io/developer-docs/latest/developer-resources/database-apis-reference/graphql-api.html#fetch-a-single-entry

## Deploy to EB

activate eb paythong env: 
`C:/Stuff/Workspace/python/envs/aws/Scripts/Activate`

eb init -p docker hfmd-cms

eb platform select

eb create --instance_type t2.medium --single --timeout 30



## create react frontend

## Commands 


### Run/Deploy/Debug commands

| Command | Description |
| - | - |
| `npx strapi develop` | Run local dev |
| `eb local run --port 1337` | Run local in docker |
| `docker stats "strapi/base"` | Docker stats (todo verify command is correct) |
| `eb ssh` | ssh into eb instance |
| `eb deploy` | deploy to eb environment |
| `/envs/aws/Scripts/Activate` | Activate python virtual env for running eb commands. Run in CMD, not PowerShell. Full path `C:/Stuff/Workspace/python/envs/aws/Scripts/Activate` |


### Python commands

| Command | Description |
| - | - |
| `pip install awsebcli --upgrade --user` | Install AWS EB CLI |




 