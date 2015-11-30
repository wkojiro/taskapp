class Bookmarklet < ActiveRecord::Base
    belongs_to :user
      validates :url, presence: true
      
#     unless url nil
#          agent = Mechanize.new
#          page = agent.get("http://qiita.com")
#          @bookmark = page.search('title')
#      end
      


end
