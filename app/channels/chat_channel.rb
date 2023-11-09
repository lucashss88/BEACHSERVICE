class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "chatclient"
  end

  def receive(data)
    # Parse the JSON data and extract the message content
    message = JSON.parse(data)["message"]

    # Send the message to the appropriate recipient using Action Cable's broadcast method
    broadcast_to("chatclient", { message: message })
  end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

