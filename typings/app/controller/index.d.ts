// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportHome = require('../../../app/controller/home');
import ExportOperate = require('../../../app/controller/operate');
import ExportUser = require('../../../app/controller/user');

declare module 'egg' {
  interface IController {
    home: ExportHome;
    operate: ExportOperate;
    user: ExportUser;
  }
}
