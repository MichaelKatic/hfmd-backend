export default [
  'strapi::errors',
  {
    name: 'strapi::security',
    config: {
      contentSecurityPolicy: {
        useDefaults: true,
        directives: {
          'connect-src': ["'self'", 'https:'],
          
          //Required for editorjs: https://market.strapi.io/plugins/strapi-plugin-react-editorjs
          'img-src': ['*'],
          'frame-src': ['*'],
          'media-src': ['*'],
          
          //Required for s3 provider: https://docs.strapi.io/developer-docs/latest/development/providers.html#configuring-providers
          // 'img-src': [ 
          //   "'self'",
          //   'data:',
          //   'blob:',
          //   'dl.airtable.com',
          //   'hfmd-strapi-prod.s3.us-west-2.amazonaws.com',
          // ],
          // 'media-src': [
          //   "'self'",
          //   'data:',
          //   'blob:',
          //   'dl.airtable.com',
          //   'hfmd-strapi-prod.s3.us-west-2.amazonaws.com',
          // ],
          upgradeInsecureRequests: null,
        },
      },
    },
  },
  'strapi::cors',
  'strapi::poweredBy',
  'strapi::logger',
  'strapi::query',
  {
    //https://market.strapi.io/plugins/strapi-plugin-import-export-entries#install-now-section
    //When importing data, imported file size may exceed the file size limit of the server. To lift up the limit, configure the Strapi middleware body:
    name: 'strapi::body',
    config: {
      jsonLimit: '10mb',
    }
  },
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];
