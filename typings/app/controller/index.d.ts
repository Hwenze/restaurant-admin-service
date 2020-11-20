// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportActivity = require('../../../app/controller/activity');
import ExportCommon = require('../../../app/controller/common');
import ExportHome = require('../../../app/controller/home');
import ExportOperate = require('../../../app/controller/operate');
import ExportProduct = require('../../../app/controller/product');
import ExportUser = require('../../../app/controller/user');

declare module 'egg' {
  interface IController {
    activity: ExportActivity;
    common: ExportCommon;
    home: ExportHome;
    operate: ExportOperate;
    product: ExportProduct;
    user: ExportUser;
  }
}
