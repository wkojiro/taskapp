class Bookmarklet < ActiveRecord::Base
    belongs_to :user
     validates :bookmarkurl,
     presence: true, 
     format: /\A#{URI::regexp(%w(http https))}\z/
  before_save :titleget

private
  def titleget
      
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows IE 7'
      @url = self.bookmarkurl
      page = agent.get(@url)
    self.title = page.search('title').text
#    self.title = "タイトル"
    
  end
      
#     unless url nil
#          agent = Mechanize.new
#          page = agent.get("http://qiita.com")
#          @bookmark = page.search('title')
#      end
      
      
      
#オブジェクトの生成・更新・削除のタイミングで呼び出されるメソッド
#トリガとなるイベント(validation,saveなど)の前(before)と後(after)に登録可能
#コールバックはメソッドチェーンに追加される。
#before_xxx で false を返すか例外を発生させると、それ以降の処理を停止させることができる (トランザクション中の場合は ROLLBACK を発生させる)


end
