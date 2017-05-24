//
//  PortFile.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/18.
//  Copyright © 2016年 YZK. All rights reserved.
//
#ifndef PortFile_h
#define PortFile_h
/**
 * 登录接口
 *
 */

static NSString *const LOGIN = @"http://221.192.201.102:90/home/appLogin.htm";

/**
 * 个人信息接口
 *
 */
static NSString *const USERMESSAGE = @"http://221.192.201.102:90/home/app_getuser.htm";

/**
 * 公共通讯录接口 按组织分类
 *
 */
static NSString *const PUBLICCONTACTDefault = @"http://221.192.201.102:90/home/ggtxl_search_list_ByUnitid.htm";

/**
 * 公共通讯录接口 按人员分类
 *
 */
static NSString *const PUBLICCONTACTPERSONNEL = @"http://221.192.201.102:90/home/ggtxl_search_list_person.htm";
/**
 * 私人通讯录分组接口
 *
 */
static NSString *const PRIVATECONTACTSECTION = @"http://221.192.201.102:90/home/addressBook/add_addressBook.htm";
/**
 * 私人通讯录分组详情接口
 *
 */
static NSString *const PRIVATECONTACTSECTIONDETAIL = @"http://221.192.201.102:90/home/addressBook/list.htm";
/**
 * 修改密码接口
 *
 */
static NSString *const CHANGEPASSWORD = @"http://221.192.201.102:90/home/editPassword.htm";

/**
 * banner
 *
 */
static NSString * const BANNER = @"http://ityf.dzwsyl.com:8080/home/advert_banner.htm";

/**  要情 接口  */
static NSString * const ImportNews = @"http://221.192.201.102:90/home/news/news_search.htm";

/**  公告 接口  */
static NSString * const Announcement = @"http://221.192.201.102:90/home/notice/notice_search.htm";

/**  简报 接口  */
static NSString * const Briefing = @"http://221.192.201.102:90/home/brief/brief_search.htm";

/**  通知 接口  */
static NSString * const Notice = @"http://221.192.201.102:90/home/message/message_search.htm";

/**  收文 管理 接口  */
static NSString * const ReceiveManage = @"http://221.192.201.102:90/home/docin_search.htm";

/**  会议室 选择 列表 接口  */
static NSString * const MeetingList = @"http://221.192.201.102:90/home/meetingYy/meetingRoom_list.htm";

/**  会议室 预约总数据 接口  */
static NSString * const ReserveAllList = @"http://221.192.201.102:90/home/meetingYy/meetingYy_list.htm";

/**  会议室 数据 过滤 接口  */
static NSString * const ReserveFilterList = @"http://221.192.201.102:90/home/meetingYy/meetingYy_list.htm";


/**  站内信已收 接口  */
static NSString * const StationLetterReceived = @"http://221.192.201.102:90/home/msg/msgInbox_list.htm";

/**  站内信已发 接口  */
static NSString * const StationLetterPosted = @"http://221.192.201.102:90/home/msg/msgOutbox_list.htm";

/**  网络硬盘 共享 接口  */
static NSString * const NetworkDiskShare = @"http://221.192.201.102:90/home/netFile/shareDownList.htm";

/**  网络硬盘 我的 接口  */
static NSString * const NetworkDiskMine = @"http://221.192.201.102:90/home/netFile/list.htm";

/**  知识库 接口  */
static NSString * const KnowledgeBase = @"http://221.192.201.102:90/home/resFile/list.htm";

/**  备忘录 接口  */
static NSString * const NoteUrl = @"http://221.192.201.102:90/home/alert/alert_list.htm";

/**  个人日程 接口  */
static NSString * const IndividualSchedule = @"http://221.192.201.102:90/home/scheduler/scheduler_list.htm";

/**  个人日程 指定 年月 接口  */
static NSString * const IndividualYearMonthSchedule = @"http://221.192.201.102:90/home/scheduler/scheduler_list_bymon.htm";

/**  工作日程 接口  */
static NSString * const TaskSchedule = @"http://221.192.201.102:90/home/workscheduler/workscheduler_list.htm";

/**  工作日程 指定 年月 接口  */
static NSString * const TaskYearMonthSchedule = @"http://221.192.201.102:90/home/workscheduler/workscheduler_list_bymon.htm";

/**  个人 工作日程 指定 年月日 接口  */
static NSString * const IndividualYearMonthDaySchedule = @"http://221.192.201.102:90/home/scheduler/scheduler_list_byday.htm";

/**  工作 工作日程 指定 年月日 接口  */
static NSString * const TaskYearMonthDaySchedule = @"http://221.192.201.102:90/home/workscheduler/workscheduler_list_byday.htm";

/**
 * 要情简报详情处理签接口
 *
 */
static NSString *const IMPORTNEWSDETAIL = @"http://221.192.201.102:90/home/news/look_detail.htm";
/**
 * 通知公告详情处理签接口
 *
 */
static NSString *const NOTICEDETAIL = @"http://221.192.201.102:90/home/message/look_detail.htm";
/**
 * 收文管理详情处理签接口
 *
 */
static NSString *const RECEVIEMAGAGEDETAIL = @"http://221.192.201.102:90/home/docin/look_detail.htm";


#endif /* PortFile_h */
