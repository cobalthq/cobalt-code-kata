function dictionaryReplacer(str, dict) {
    if (Object.keys(dict).length == 0) {
      return str;
    }

    let new_string = str;
    
    Object.entries(dict).forEach(([key, value]) => {
      new_string = new_string.replaceAll(`$${key}$`, value)
    });

    return new_string;
}

module.exports = {
  dictionaryReplacer,
}
