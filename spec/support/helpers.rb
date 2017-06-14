# Testing Helpers
module Helpers
  # Parses JSON response body into ruby +Hash+
  # @param object [Symbol] restful key
  # @return +Hash+
  def rest_response_body(object = nil)
    result = JSON.parse(response.body, symbolize_names: true)
    result[object] unless object.nil?
  end

  # Parses JSON response body into ruby +Hash+
  # @return +Hash+
  def response_body
    JSON.parse(response.body, symbolize_names: true)
  end

  # Parses JSON body page request into ruby +Hash+
  # @return +Hash+
  def page_body
    JSON.parse(page.body, symbolize_names: true)
  end

  # sends an authentication request to defined +user_session_url+ for
  # the given +email+ and +password+ combination. sets a global variable with
  # response headers with the generated token if authentication was
  # successful.
  # @param email [String] - AppUser email attribute
  # @param password [String] - AppUser password attribute
  # @return nil
  def api_user_login(email, password)
    url = user_session_url
    params = {
      email: email,
      password: password
    }
    page.driver.submit :post, url, params
    @api_user_headers = page.response_headers
  end

  # Generates session from created user and attaches request
  # headers
  # @return nil
  def api_user_headers
    user = create(:user)
    headers = api_user_login(user.email, user.password)
    request.headers['access-token'] = headers['access-token']
    request.headers['client'] = headers['client']
    request.headers['uid'] = headers['uid']
  end

  def base64_file
    encoded_file = Base64.encode64(
      File.open(
        Rails.root.join('spec', 'support', 'files', 'test.docx'),
        'rb'
      ).read
    )
    "data:image/jpeg;base64,#{encoded_file}"
  end
end
