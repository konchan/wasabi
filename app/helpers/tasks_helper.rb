# coding: utf-8
module TasksHelper
  def get_title(cnt)
    case cnt
    when 0 then return "締め切りが過ぎたタスク"
    when 1 then return "締め切り間近のタスク"
    when 2 then return "上記以外のタスク"
    end
  end
  
  def get_comment(cnt)
    case cnt
    when 0 then return "締め切りが過ぎているタスクはありません"
    when 1 then return "締め切り間近のタスクはありません"
    when 2 then return "登録されているタスクはありません"
    end
  end
end
