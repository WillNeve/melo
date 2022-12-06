module ChatroomHelper

#   def message_time_elapsed(timestamp)
#     <% message_timestamp = message.created_at.to_s %>
# <% timestamp_split = message_timestamp.split(' ') %>
# <% date_split = timestamp_split[0].split('-') %>
# <% time_split = timestamp_split[1].split(':') %>
# <% time = Time.new(date_split[0], date_split[1], date_split[2], time_split[0], time_split[1], time_split[2]) %>
# <% minutes_ago = ((Time.now - time) / 60).round() %>
# <% hours_ago = (minutes_ago / 60).round() %>
# <% days_ago = (hours_ago / 24).round() %>
# <% case minutes_ago %>
# <% when 60..1439 %>
#   <% message_elapsed = "#{hours_ago} hours ago" %>
# <% when 1440..(1.0/0.0) %>
#   <% message_elapsed = "#{days_ago} days ago" %>
# <% else %>
#   <% if minutes_ago == 0 %>
#     <% message_elapsed = "Just now" %>
#   <% else %>
#     <% message_elapsed = "#{minutes_ago} minutes ago" %>
#   <% end %>
# <% end %>

#   end
end
