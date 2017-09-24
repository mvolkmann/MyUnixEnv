# This function is run every time Fish displays a new prompt.
# When using vi key bindings, it outputs
# something to indicate the current vi mode.
function fish_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color red
        echo N
      case insert
        set_color green
        echo I
      case replace_one
        set_color green
        echo R
      case visual
        set_color magenta
        echo V
    end
    echo ' '
  end
end
