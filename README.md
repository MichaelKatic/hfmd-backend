# How This Repo Was Created
## Create strapi backend

1. npx create-strapi-app@latest hfmd-strapi
1. install posgress on local machine
1. Setup AWS RDS with postgress following instructions [here](https://docs.strapi.io/developer-docs/latest/setup-deployment-guides/deployment/hosting-guides/amazon-aws.html)
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

## AWS Create Eb Environment

1. activate eb paython env: `C:/Stuff/Workspace/python/envs/aws/Scripts/Activate`
1. eb init -p docker hfmd-cms
1. eb platform select
1. eb create --instance_type t2.medium --single --timeout 30

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

### Strapi Command Line

The Strapi CLI has all kinds of useful commands. Read more about them [here](https://docs.strapi.io/developer-docs/latest/developer-resources/cli/CLI.html#strapi-new). A few I use are:

| Command | Description |
| - | - |
| `npm run strapi routes:list` | Get avaialable routes
| `strapi develop --watch-admin --browser 'google chrome'`| auto reload | 
| `strapi admin:create-user` | Create admin user |

## Running Local in Docker

1. Install PgAdmin to setup local postgres database
1. Create new db (DATABASE_NAME=strapi. DATABASE_USERNAME=postgres)
1. Allow outside connections (to allow docker to connect). Set these in the following files. ([Related SO](https://stackoverflow.com/questions/1287067/unable-to-connect-postgresql-to-remote-database-using-pgadmin))
    * C:\Program Files\PostgreSQL\15\data\postgresql.conf: `listen_addresses = '*'`
    * C:\Program Files\PostgreSQL\15\data\pg_hba.conf: `host all all 0.0.0.0/0 md5`
1. Run `ipconfig` and set local.env var "DATABASE_HOST" to value. 