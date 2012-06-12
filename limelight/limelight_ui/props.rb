# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

limelight_board :id => "limelight_board" do
  
  info_panel do
    display_text :id => 'display', :styles => 'display_text', :text => "Select Players & Press Start"
  end
  
  ttt_board do
    (1..9).each { |n| square :id => "square#{n}", :styles => "square"}
  end
  
  control_row do
    first_player do
      first_player_title :text => "Player 1 Type (X)", :styles => "selection_text"
      first_player_options :id => 'first_player', :players => 'combo_box', :choices => ['Computer', 'Human']
    end
    second_player do
      second_player_title :text => "Player 2 Type (O)", :styles => "selection_text"
      second_player_options :id => 'second_player', :players => 'combo_box', :choices => ['Computer', 'Human']
    end
  end

  button_row do
    start_button :text => "Start", :styles => "button"
    reset_button :id => "reset_btn", :styles => "button", :text => "Reset"
  end

end