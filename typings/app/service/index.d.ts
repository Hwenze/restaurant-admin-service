// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
type AnyClass = new (...args: any[]) => any;
type AnyFunc<T = any> = (...args: any[]) => T;
type CanExportFunc = AnyFunc<Promise<any>> | AnyFunc<IterableIterator<any>>;
type AutoInstanceType<T, U = T extends CanExportFunc ? T : T extends AnyFunc ? ReturnType<T> : T> = U extends AnyClass ? InstanceType<U> : U;
import ExportCommon = require('../../../app/service/common');
import ExportOperate = require('../../../app/service/operate');
import ExportProduct = require('../../../app/service/product');
import ExportUser = require('../../../app/service/user');

declare module 'egg' {
  interface IService {
    common: AutoInstanceType<typeof ExportCommon>;
    operate: AutoInstanceType<typeof ExportOperate>;
    product: AutoInstanceType<typeof ExportProduct>;
    user: AutoInstanceType<typeof ExportUser>;
  }
}
