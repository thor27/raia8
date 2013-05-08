module StudentsHelper
  def block_link(student)
    if student.state == 'active'
      link_to 'Block', set_state_student_path(student, state: 'blocked'), method: :put
    else
      link_to 'Unblock', set_state_student_path(student, state: 'active'), method: :put
    end
  end
end
