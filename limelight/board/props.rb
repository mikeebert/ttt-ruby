# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

limelight_board :id => "limelight_board" do
  
  control_row do
    option_button :text => "Human vs Human", :styles => "button", :on_mouse_clicked => "scene.begin_game"
    option_button :text => "Human vs Computer", :styles => "button", :on_mouse_clicked => "scene.begin_game"
    reset_button :id => "reset_btn", :styles => "button", :text => "RESET"
  end

  ttt_board do
    (1..9).each { |n| square :id => "square#{n}", :styles => "square"}
  end
  
  info_panel do
    display_text :id => 'display_text', :text => "Welcome to Tic Tac Toe."
  end

end