module Public::CosmeItemsHelper
  def render_with_hashtags(hashbody)
    #hashbodyの中より正規表現にヒットする情報を取り出しgsubで変換をする処理
    hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/cosme_item/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end
