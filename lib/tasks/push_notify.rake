task push_notify: :environment do
  PushNotify.publish_date_notify
end
