# coding: utf-8
module TopicsHelper
  def show_post_time(time)
    time_now = Time.now
    sec = (time_now- time).to_i
    return "#{sec}秒前" if sec < 60
    return time.strftime('%Y-%m-%d %H:%M:%S') if sec/86400 >3
    return "#{sec/86400}天前 " if sec > 86400
    return "#{sec/3600}小时前 " if sec > 3600
    return "#{sec/60}分钟前 " if sec > 60
  end
end
