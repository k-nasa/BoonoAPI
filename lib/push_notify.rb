# push通知用のメソッド郡
class PushNotify
  # 発売日に通知
  def self.publish_date_notify
    client = Andpush.new(ENV['FIREBASE_SERVER_KEY'])

    users = NotifyBook.today_notify_users
    users.each do |user|
      payload = {
        to: user.device_token,
        notification: {
          title: "Boono",
          body: "本日発売の本があります"
        }
      }
      p user
      responce = client.push(payload) if !!user.device_token
      p response&.json
    end
  end
end
