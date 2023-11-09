import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // Parse the JSON data and extract the message content
    const message = JSON.parse(data)["message"];

    // Append the message to the chat window
    const chatContainer = document.getElementById("chat-container");
    const newMessageElement = document.createElement("div");
    newMessageElement.textContent = message;
    chatContainer.appendChild(newMessageElement);
  }
});
