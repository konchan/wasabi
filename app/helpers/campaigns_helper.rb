# coding: utf-8
module CampaignsHelper
  def to_currency(number)
    # 100万円以下は省略
    unless number.nil? || number == 0
      n = number / 1000000
      return "#{n.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse} 百万円"
    else
      return "0百万円"
    end
  end
end
