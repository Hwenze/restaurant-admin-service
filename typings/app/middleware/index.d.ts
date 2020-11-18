// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportErrorHandler = require('../../../app/middleware/errorHandler');
import ExportTokenHandler = require('../../../app/middleware/tokenHandler');

declare module 'egg' {
  interface IMiddleware {
    errorHandler: typeof ExportErrorHandler;
    tokenHandler: typeof ExportTokenHandler;
  }
}
