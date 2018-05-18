function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

console.log(madLib("do","soft","stone"))

function isSubstring(string, substring) {

  if string.includes(substring){
    return true
  }
  else {
    return false
  };
}

// console.log(isSubstring("time to program", "time"))
