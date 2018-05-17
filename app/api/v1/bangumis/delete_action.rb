module V1
  module Bangumis
    class DeleteAction < Grape::API
      resource 'bangumis' do
        desc '删除番剧' do
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
          requires :creator_id,   type: Integer, allow_blank: false, desc: '创建者ID'
          requires :id,           type: Integer, allow_blank: false, desc: '番剧ID'
        end

        post 'delete' do
          Bangumi.soft_delete params
        end
      end
    end
  end
end