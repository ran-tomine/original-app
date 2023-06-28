import consumer from "./consumer";

if (location.pathname.match(/\/rooms\/\d/)) {
  consumer.subscriptions.create(
    {
      channel: "MessageChannel",
      room_id: location.pathname.match(/\d+/)[0],
    },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
      received(data) {
        
        const messageData = {
          user: { nickname: data.user.nickname },
          message: {
            created_at: data.message.created_at,
            content: data.message.content,
          },
          image: data.image, // 修正: data.image を直接代入
        };
        appendMessage(messageData);
        scrollToBottom(); // メッセージ受信後にスクロール
      },
    }
  );
}

// 以下の部分の修正は不要です

// メッセージを追加する関数
function appendMessage(data) {
  const image = data.image ? `<img src="${data.image}" alt="message image" class="message-image" style="max-width: 500px; max-height: 500px;">` : "";
  const html = `
    <div class="message">
      <div class="upper-message">
        <div class="message-user">
          ${data.user.nickname}
        </div>
        <div class="message-date">
          ${new Date(data.message.created_at).toLocaleString("ja-JP", {
            hour12: false,
          })}
        </div>
      </div>
      <div class="lower-message">
        <div class="message-content">
          ${data.message.content}
        </div>
      ${image}
      </div>
    </div>
  `;
  const messages = document.getElementById("messages");
  messages.insertAdjacentHTML("beforeend", html);
  const commentForm = document.getElementById("message-form");
  commentForm.reset();

  setTimeout(() => {
    const submitButton = commentForm.querySelector("input[type='submit']");
    submitButton.disabled = false;
  }, 500);

  // 以下のコードを追加
  const images = document.getElementsByClassName("message-image");
  for (let i = 0; i < images.length; i++) {
    images[i].addEventListener("load", scrollToBottom);
  }
}

// スクロールを一番下に移動する関数
function scrollToBottom() {
  const messages = document.getElementById("messages");
  messages.scrollTop = messages.scrollHeight;
}
