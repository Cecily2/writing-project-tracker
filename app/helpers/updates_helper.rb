module UpdatesHelper
  def edit_update_link(update)
    link_to "Edit Update", [:edit, update.project, update], class: "btn btn-sm btn-secondary"  if can? :update, update
  end

  def delete_update_link(update)
    link_to 'Delete Update', [update.project, update], method: :delete, class: "btn btn-sm btn-secondary" if can? :destroy, update
  end
end
