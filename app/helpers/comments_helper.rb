module CommentsHelper

  def delete_comment_link(comment)
    if can? :destroy, comment
      link_to 'Delete Comment', [comment.progress_update.project, comment.progress_update, comment], method: :delete, class: "delete-comment"
    end
  end

end
