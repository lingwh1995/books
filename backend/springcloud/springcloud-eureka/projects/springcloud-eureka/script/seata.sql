CREATE DATABASE seata_order;
CREATE DATABASE seata_storage;
CREATE DATABASE seata_account;

USE seata_order;
-- seata_ order订单表：
CREATE TABLE t_order(
                        id BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                        user_id BIGINT(11) DEFAULT NULL COMMENT '用户id',
                        product_id BIGINT(11) DEFAULT NULL COMMENT '产品id',
                        count INT(11) DEFAULT NULL COMMENT '数量',
                        money DECIMAL(11,0) DEFAULT NULL COMMENT '金额',
                        status INT(1) DEFAULT NULL COMMENT '订单状态：0创建中，1已完结'
)ENGINE=InnoDB AUTO_INCREMENT=7 CHARSET=utf8;

-- for AT mode you must to init this sql for you business database. the seata server not need it.
CREATE TABLE IF NOT EXISTS `undo_log`(
                                         `branch_id`     BIGINT       NOT NULL COMMENT 'branch transaction id',
                                         `xid`           VARCHAR(128) NOT NULL COMMENT 'global transaction id',
    `context`       VARCHAR(128) NOT NULL COMMENT 'undo_log context,such as serialization',
    `rollback_info` LONGBLOB     NOT NULL COMMENT 'rollback info',
    `log_status`    INT(11)      NOT NULL COMMENT '0:normal status,1:defense status',
    `log_created`   DATETIME(6)  NOT NULL COMMENT 'create datetime',
    `log_modified`  DATETIME(6)  NOT NULL COMMENT 'modify datetime',
    UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8 COMMENT ='AT transaction mode undo table';




USE seata_storage;
-- seata_ storage库存表：
CREATE TABLE t_storage(
                          id BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                          product_id BIGINT(11) DEFAULT NULL COMMENT '产品id',
                          total INT(11) DEFAULT NULL COMMENT '总库存',
                          used INT(11) DEFAULT NULL COMMENT '已用库存',
                          residue INT(11) DEFAULT NULL COMMENT '剩余库存'
)ENGINE=InnoDB AUTO_INCREMENT=7 CHARSET=utf8;

INSERT INTO t_storage(id, product_id, total, used, residue) VALUES(1,1,100,0,100);

-- for AT mode you must to init this sql for you business database. the seata server not need it.
CREATE TABLE IF NOT EXISTS `undo_log` (
                                          `branch_id`     BIGINT       NOT NULL COMMENT 'branch transaction id',
                                          `xid`           VARCHAR(128) NOT NULL COMMENT 'global transaction id',
    `context`       VARCHAR(128) NOT NULL COMMENT 'undo_log context,such as serialization',
    `rollback_info` LONGBLOB     NOT NULL COMMENT 'rollback info',
    `log_status`    INT(11)      NOT NULL COMMENT '0:normal status,1:defense status',
    `log_created`   DATETIME(6)  NOT NULL COMMENT 'create datetime',
    `log_modified`  DATETIME(6)  NOT NULL COMMENT 'modify datetime',
    UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8 COMMENT ='AT transaction mode undo table';

USE seata_account;
-- seata_ account账户信息表：
CREATE TABLE t_account(
                          id BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                          user_id BIGINT(11) DEFAULT NULL COMMENT '用户id',
                          total DECIMAL(10,0) DEFAULT NULL COMMENT '总额度',
                          used DECIMAL(10,0) DEFAULT NULL COMMENT '已用额度',
                          residue DECIMAL(10,0) DEFAULT 0 COMMENT '剩余可用额度'
)ENGINE=InnoDB AUTO_INCREMENT=7 CHARSET=utf8;
INSERT INTO t_account(id, user_id, total, used, residue) VALUES(1,1,1000,0,1000);

-- for AT mode you must to init this sql for you business database. the seata server not need it.
CREATE TABLE IF NOT EXISTS `undo_log` (
                                          `branch_id`     BIGINT       NOT NULL COMMENT 'branch transaction id',
                                          `xid`           VARCHAR(128) NOT NULL COMMENT 'global transaction id',
    `context`       VARCHAR(128) NOT NULL COMMENT 'undo_log context,such as serialization',
    `rollback_info` LONGBLOB     NOT NULL COMMENT 'rollback info',
    `log_status`    INT(11)      NOT NULL COMMENT '0:normal status,1:defense status',
    `log_created`   DATETIME(6)  NOT NULL COMMENT 'create datetime',
    `log_modified`  DATETIME(6)  NOT NULL COMMENT 'modify datetime',
    UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8 COMMENT ='AT transaction mode undo table';