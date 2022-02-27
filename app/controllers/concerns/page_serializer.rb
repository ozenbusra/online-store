module PageSerializer
  extend ActiveSupport::Concern

  def page_serializer(pagy_obj)
    page_info = {
      "page" => pagy_obj.vars[:page],
      "size" => pagy_obj.vars[:items],
      "count" => pagy_obj.vars[:count],
    }
  end
end
