require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    # ルートURLにGETリクエストを送る
    get root_path

    # 正しいテンプレートが描画されているか確認する
    assert_template 'static_pages/home'

    # 各リンクが存在するかを確かめる
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path  # ?をhelp_pathへと変換
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
