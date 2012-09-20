# coding: utf-8
module CampaignsHelper
  def to_currency(number)
    unless number.nil? || number == 0
      if number >= 1000000
        n = number / 1000000
        return "#{n.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse} 百万円"
      else
        n = number / 1000
        return "#{n.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse} 千円"
      end
    else
      return "0百万円"
    end
  end
end
