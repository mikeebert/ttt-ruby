# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

limelight_board {
  background_color :white
  horizontal_alignment :center
  vertical_alignment :top
  width 350
  height 460
  padding 20
}

control_row {
  width 300
  height 70
  top_padding 10
  bottom_padding 10
  left_padding 20
  right_padding 20
  horizontal_alignment :center
}

ttt_board {
  height 300
  width 300
}

square {
  height 100
  width 100
  border_color :black
  border_width 2
  horizontal_alignment :center
  vertical_alignment :center
  font_size 48
}

button {
  width 80
  height 50
  rounded_corner_radius 10
  border_color :black
  border_width 1
  font_size 12
  background_color :gray
  text_color :white
  horizontal_alignment :center
  vertical_alignment :center
  right_margin 5
}

info_panel {
  background_color "#cccccc"
  width 300
  height 60
  top_margin 10
  padding 10
  vertical_alignment :center
}

display_text {
  font_size 12
  text_color :black
  horizontal_alignment :center
}

