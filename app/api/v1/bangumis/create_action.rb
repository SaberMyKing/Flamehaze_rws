module V1
  module Bangumis
    class CreateAction < Grape::API
      resource 'bangumis' do
        desc '创建新番剧' do
          detail %(
# 返回值:
```ruby
{
  "return_code" : 0,
  "return_info" : "success"
}
```
)
        end

        params do
          requires :creator_id,   type: Integer,  allow_blank: false,   desc: '创建者ID'
          requires :name,         type: String,   allow_blank: false,   desc: '番剧名'
          optional :show_month,   type: String,   allow_blank: true,    desc: '开播时间'
          requires :episode_num,  type: Integer,  allow_blank: false,   desc: '番剧集数'
        end

        post 'create' do
          Bangumi.create_new params
        end
      end
    end
  end
end