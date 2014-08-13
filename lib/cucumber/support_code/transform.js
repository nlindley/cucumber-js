var Transform = function Transform(pattern, code) {
  var regex = pattern;
  var handler = code;

  function transform(arg) {
    if (regex.test(arg)) {
      return handler(arg);
    } else {
      return param;
    }
  }

  return {
    transform: transform
  };
};

module.exports = Transform;
