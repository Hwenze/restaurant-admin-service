/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1605063566141_1968';

  // 中间件
  config.middleware = ['errorHandler'];

  // 服务端口号
  config.cluster = {
    listen: {
      path: '',
      port: 8080,
      hostname: '0.0.0.0',
    }
  };

  // sql配置
  config.mysql = {
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: '12345678',
      database: 'restaurant',
    }
  };

  config.jwt = {
    // key
    secret: 'restaurant',
    ignore: ['/login']
  }

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
