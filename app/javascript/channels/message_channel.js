import consumer from "./consumer";

if (location.pathname.match(/\/rooms\/\d/)) {

  consumer.subscriptions.create({
    channel: "MessageChannel",
    room_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
    received(data) {
      const html = `
        <div class="message">
          <div class="upper-message">
            <div class="message-user">
              <!-- 投稿したユーザー名情報を出力する -->
              ${data.user.nickname}
            </div>
            <div class="message-date">
              <!-- 投稿した時刻を出力する -->
              ${new Date(data.message.created_at).toLocaleString("ja-JP", {
                hour12: false,
              })}
            </div>
          </div>
          <div class="lower-message">
            <div class="message-content">
              <!-- 投稿したメッセージ内容を記述する -->
              ${data.message.content}
            </div>
            <div class="message-image">
              ${
                data.message.image && data.message.image.attached
                  ? `<img src="${data.message.image.url}" alt="message image">`
                  : ""
              }
            </div>
          </div>
        </div>
      `;
      const messages = document.getElementById("messages");
      messages.insertAdjacentHTML("beforeend", html);
      const commentForm = document.getElementById("message-form");
      commentForm.reset();

      // 送信ボタンを再び有効化するための遅延
      setTimeout(() => {
        const submitButton = commentForm.querySelector("input[type='submit']");
        submitButton.disabled = false;
      }, 500);
    },
  });
}
