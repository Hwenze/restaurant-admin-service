// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
type AnyClass = new (...args: any[]) => any;
type AnyFunc<T = any> = (...args: any[]) => T;
type CanExportFunc = AnyFunc<Promise<any>> | AnyFunc<IterableIterator<any>>;
type AutoInstanceType<T, U = T extends CanExportFunc ? T : T extends AnyFunc ? ReturnType<T> : T> = U extends AnyClass ? InstanceType<U> : U;
import ExportActivity = require('../../../app/service/activity');
import ExportCommon = require('../../../app/service/common');
import ExportMember = require('../../../app/service/member');
import ExportOperate = require('../../../app/service/operate');
import ExportOrder = require('../../../app/service/order');
import ExportProduct = require('../../../app/service/product');
import ExportUser = require('../../../app/service/user');

declare module 'egg' {
  interface IService {
    activity: AutoInstanceType<typeof ExportActivity>;
    common: AutoInstanceType<typeof ExportCommon>;
    member: AutoInstanceType<typeof ExportMember>;
    operate: AutoInstanceType<typeof ExportOperate>;
    order: AutoInstanceType<typeof ExportOrder>;
    product: AutoInstanceType<typeof ExportProduct>;
    user: AutoInstanceType<typeof ExportUser>;
  }
}
