let s:false = 0
let s:true = 1

function! hc#GetCharUnderCursor()
  let s:text = getline('.')
  let s:line = line('.') " one-based
  let s:column = col('.') " one-based
  return s:text[s:column - 1]
endfunction

function! hc#GetNextChar()
  if s:column >= len(s:text)
    let s:line += 1
    let s:text = getline(s:line)
    let s:column = 1
  else
    let s:column += 1
  endif
  return s:text[s:column - 1]
endfunction

function! hc#GetPrevChar()
  if s:column <= 1
    let s:line -= 1
    let s:text = getline(s:line)
    let s:column = len(s:text)
  else
    let s:column -= 1
  endif
  return s:text[s:column - 1]
endfunction

function! hc#Echo10Chars()
  echomsg hc#GetCharUnderCursor()
  let i = 0
  while i < 10
    echomsg hc#GetNextChar()
    let i += 1
  endwhile
endfunction

function! hc#Comment()
  let dashCount = 0
  let maybeComment = s:false
  let prevChar = hc#GetCharUnderCursor()

  while s:true
    let char = hc#GetPrevChar()

    if char == '-'
      let dashCount += 1
    elseif char == '!'
      let maybeComment = dashCount >= 2
      let dashCount = 0
    elseif char == '"' || char == "'"
      let prevChar = hc#GetPrevChar()
      if prevChar != '=' " not at beginning of an attribute value
        " Find the matching string delimiter that precedes this one
        while prevChar != char
          let prevChar = hc#GetPrevChar()
        endwhile

        let [dashCount, maybeComment] = [0, s:false]
      endif
    elseif char == '<'
      if maybeComment
        " Change the start and end delimiters of this comment.
        " Change <!-- --> to <!__ __>
        let maybeComment = s:false
      elseif prevChar == '/'
        " We found an end tag.
        let gtCol = hc#StringFind(s:text, s:column, '>')
        let tagName = s:text[s:column + 2:gtCol]
        echomsg 'found end tag ' . tagName
        " Find the matching start tag.
        " Comment out this element.
        break
      else
        " We found a start tag.
        let [startLine, startColumn] = [s:line, s:column]
 
        " Begin the comment.
        call hc#InsertText(startLine, startColumn + 1, '!--')

        " Get the tag name.
        let tagName = ''
        let char = hc#GetNextChar()
        while char != '>'
          let tagName .= char
          let char = hc#GetNextChar()
        endwhile

        " If this is one of the HTML5 empty elements ...
        if hc#IsEmptyElement(tagName)
          " Comment out this element.
        else
          " Find the matching end tag
          let [endLine, endColumn] = searchpos('</' . tagName . '>')

          " End the comment.
          call hc#InsertText(endLine, endColumn + 2 + strlen(tagName), '--')
          break
        endif
      endif
    else
      let [dashCount, maybeComment] = [0, s:false]
    endif

    let prevChar = char
  endwhile
endfunction

function! hc#Uncomment()
  echomsg 'Uncomment entered'
endfunction

function! hc#CommentLine(row)
  call hc#InsertText(a:row, 1, '<!--')
  let column = len(getline(a:row))
  call hc#AppendText(a:row, column, '-->')
endfunction

function! hc#AppendText(row, column, text)
  " Move to line number equal to a:row.
  let command = 'normal! ' . a:row . 'G'
  if a:column > 1
    " Move to column equal to a:column.
    let command .= (a:column - 1) . 'l'
  endif
  " Enter append mode and add text.
  let command .= 'a' . a:text
  execute command
endfunction

function! hc#InsertText(line, column, text)
  call setpos('.', [0, a:line, a:column])
  " Enter insert mode and add text.
  execute 'normal i' . a:text
endfunction

function! hc#IsEmptyElement(tag)
  return s:false
endfunction

function! hc#StringFind(text, start, substr)
  "TODO: Figure out how to find the index of a substring within a string.
  "TODO: It seems the builtin index function only works on lists.
  "TODO: Can you create a list of characters from a string?
  return s:false
endfunction
