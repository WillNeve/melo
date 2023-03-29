module TimestampHelper
  def time_from_timestamp(timestamp)
    timestamp_split = timestamp.to_s.split(' ')
    date_split = timestamp_split[0].split('-')
    time_split = timestamp_split[1].split(':')
    time = Time.new(date_split[0], date_split[1], date_split[2], time_split[0], time_split[1], time_split[2])
    return time
  end
end
