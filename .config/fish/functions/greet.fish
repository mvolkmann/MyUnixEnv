# See completions defined in ../completions/greet.fish.

function greet -a name language
  # If language is not set, set it to "english".
  # [1] is needed because every variable is a list and
  # this verifies that the list contains at least one element.
  set -q language[1]; or set language english
  switch "$language"
    case 'english'
      echo 'Hello, '$name
    case 'french'
      echo 'Bonjour, '$name
    case 'spanish'
      echo 'Hola, '$name
    case '*'
      echo unsupported language $language
  end
end
