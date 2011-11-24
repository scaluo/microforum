class HomeController < ApplicationController
  before_filter :authenticate,:except => [:index]
  def index
  end

  def init
    Category.create(:name=>'C# & .NET')
    Category.create(:name=>'JavaScript')
    Category.create(:name=>'CSS & XHTML')
    Category.create(:name=>'Ruby')
    Category.create(:name=>'Ruby ON Rails')
    redirect_to root_path
  end

end
