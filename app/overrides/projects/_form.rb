Deface::Override.new :virtual_path  => 'projects/settings/_issues',
                     :name          => 'add-auto-private-issues-option-to-project',
                     :insert_before => "erb[loud]:contains('submit_tag')",
                     :text          => %(
                       <div class="box tabular">
                         <p>
                           <label style="margin-left:0; font-weight:normal; width:auto;">
                             <%= hidden_field_tag 'project[force_private_issues]', 0 %>
                             <%= check_box_tag 'project[force_private_issues]', 1, @project.force_private_issues %>
                             <%= l(:label_force_private_issues) %>
                           </label>
                         </p>
                       </div>
                     )
