module StudentsHelper
  def block_link(student)
    if student.active?
      link_to 'Block', set_state_student_path(student, state: 'blocked'), method: :put, class: 'btn btn-danger'
    else
      link_to 'Unblock', set_state_student_path(student, state: 'active'), method: :put, class: 'btn btn-success'
    end
  end
end
