class MembershipDecorator < Draper::Decorator
  delegate_all

  def number_of_days(date_time)
    h.time_ago_in_words(date_time)
  end

  def created_long_full_date
    created_at.strftime("%B %-d, %Y").downcase
  end
end
