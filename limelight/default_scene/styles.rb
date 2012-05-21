# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
  background_color :white
  horizontal_alignment :left
  vertical_alignment :top
  width "100%"
  height "100%"
}

control_row {
  width '100%'
  height 60
  top_padding 10
  bottom_padding 10
  left_padding 20
  right_padding 20
}

limelight_board {
  height '100%'
  width 340
  padding 20
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

reset_button {
  width 120
  height 40
  rounded_corner_radius 10
  border_color :black
  border_width 1
  font_size 18
  background_color :gray
  text_color :white
  horizontal_alignment :center
  vertical_alignment :center
}