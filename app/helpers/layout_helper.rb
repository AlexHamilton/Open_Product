module LayoutHelper
  def add_breadcrumb(node_title, show_node = true)
    content_for(:node_title) { node_title.to_s }
    @show_node = show_node
  end

  def show_node?
    @show_node
  end
end
