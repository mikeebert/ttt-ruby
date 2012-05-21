# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

control_row do
  reset_button :id => "reset_btn", :styles => "reset_button", :text => "RESET"
end

limelight_board do
  (1..9).each { |n| square :id => "square#{n}", :styles => "square"}
end
