# coding: utf-8
module ActivitiesHelper
  def get_planned_activities_title(idx)
    case idx
    when 0 then return "今後１週間の活動予定"
    when 1 then return "今後１ヶ月間の活動予定"
    when 2 then return "１ヶ月以降の活動予定"
    end
  end
end
