Deface::Override.new :virtual_path  => 'projects/_form',
                     :name          => 'add-auto-private-issues-option-to-project',
                     :insert_bottom => '#project_trackers',
                     :text          => %(
                       <div class="clear"></div>
                       <div style="margin-top:15px; padding:8px 0; border-top:1px solid #ddd;">
                         <label style="margin-left:0; font-weight:normal; width:auto;">
                           <%= hidden_field_tag 'project[force_private_issues]', 0 %>
                           <%= check_box_tag 'project[force_private_issues]', 1, @project.force_private_issues %>
                           <%= l(:label_force_private_issues) %>
                         </label>
                       </div>
                     )
