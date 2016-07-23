class RepositoriesController < ApplicationController
  def index
    response = GithubService.new({"access_token" => session[:token]})
    @repos_array = response.get_repos
  end

  def create
    GithubService.new({"access_token" => session[:token]}).create_repo(params[:name])
    redirect_to '/'
  end
end