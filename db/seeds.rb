# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Task.destroy_all
Comment.destroy_all

Priority.destroy_all
Priority.create(:name => "最高", :design => "#CC3333")
Priority.create(:name => "高", :design => "#FF6633")
Priority.create(:name => "中", :design => "#66CC33")
Priority.create(:name => "低", :design => "#336666")

ActionKind.destroy_all
ActionKind.create(:name => "訪問", :design => "#eeb859")
ActionKind.create(:name => "メール", :design => "#BA55D3")
ActionKind.create(:name => "ダイレクトメール（DM）", :design => "#3CB371")
ActionKind.create(:name => "電話", :design => "#FA8072")
ActionKind.create(:name => "来客", :design => "#808000")

Phase.destroy_all
Phase.create(:name => "ご挨拶", :design => "#fadbad")
Phase.create(:name => "説明", :design => "#dba05c")
Phase.create(:name => "要件ヒアリング", :design => "#dc8b6f")
Phase.create(:name => "契約調整", :design => "#d8748a")
Phase.create(:name => "検証", :design => "#8e80e5")
Phase.create(:name => "デモ", :design => "#87adcf")
Phase.create(:name => "保留", :design => "#362b2b")

Accuracy.destroy_all
Accuracy.create(:name => "Opportunity", :design => "#54824a")
Accuracy.create(:name => "Target", :design => "#a1bc9f")
Accuracy.create(:name => "Commit", :design => "#001ccc")
Accuracy.create(:name => "Challenge", :design => "#2f43a7")
Accuracy.create(:name => "Drop", :design => "#444444")

Kind.destroy_all
Kind.create(:name => "全て", :design => "#ffffff")
Kind.create(:name => "ITコンサル", :design => "#6d4389")
Kind.create(:name => "PMO", :design => "#5b60c2")
Kind.create(:name => "運用コンサル", :design => "#689a65")
Kind.create(:name => "Neuron", :design => "#d26319")
Kind.create(:name => "その他", :design => "#20B2AA")

Contact.destroy_all
Contact.create(:name => "未定")

User.destroy_all
User.create(:name => "未定", :email => "xxx@example.com", :password => "abcdefg")

Customer.destroy_all
Customer.create(:name => "BTI", :code => "BTI")

Contact.destroy_all
Contact.create(:name => "未定", :customer_id => Customer.where(:name => "BTI").first.id)

Campaign.destroy_all
Campaign.create(:name => "共通", :code => "BTI000", 
                :kind_id => Kind.where(:name => "その他").first.id,
                :customer_id => Customer.where(:name => "BTI").first.id,
                :contact_id => Contact.where(:name => "未定").first.id)

Activity.destroy_all
Activity.create(:name => "共通", :number => 0, :detail => "顧客に依存しない共通の活動です。", :campaign_id => Campaign.where(:name => "共通").first.id)