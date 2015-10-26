# Notes

`printf` and `echo` are fundamentally different in the way that `printf` is used for formatted printing on the screen, while `echo` is not. `echo` can barely understand escape sequences while `printf` is made for it.

`printf "\033[s"` - Save the cursor position. </br>
`printf "\033[u"` - Restore the cursor position.  </br>
`printf "\033[J"` - Clear from cursor to the end of the screen.  </br>


`function waitForQ
{
        read -n 1 -s -t 0.1 key
        if [[ $key == "q" ]]
        then
            break
        fi
}`

