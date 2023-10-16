module ClientsHelper
  def saudacao()
    @last_client = Client.last
    render partial: 'shared/last_client', locals: { last_client: @last_client }
  end
  def last_id
    @last_client = Client.last.id
  end
end
