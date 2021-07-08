module RequestAPI
  def body_json(symbolize_keys: false)
    json = JSON.parse(response.body)
    symbolize_keys ? json.deep_symbolize_keys : json
  rescue # caso possua algum erro na execução do código acima rescue funciona como um try/catch
    return {}
  end

  def auth_header(user = nil, merge_with: {})
    user ||= create(:user) # a sintaxe ||= faz a avaliação de user se for indefinido ou nulo então atribui o valor de create(:user), caso contrário não atribui nada.
    auth = user.create_new_auth_token # método disponibilizado pelo Devise Token Auth para auxiliar nos testes
    header = auth.merge({ 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
    header.merge merge_with # merge_with serve para setar parametros adicionais ao cabeçalho, por padrão está vazio
  end
end

RSpec.configure do |config|
  config.include RequestAPI, type: :request
end