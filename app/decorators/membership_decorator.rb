class MembershipDecorator < Draper::Decorator
  delegate_all

  def number_of_days
    h.distance_of_time_in_words_to_now(self.accepted_at || league.created_at)
  end
end
