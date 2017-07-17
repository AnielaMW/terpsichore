let appendTarget = (target, text) => {
  target.append(text);
};

let prependTarget = (target, text) => {
  target.prepend(text);
};

let removeTarget = (target) => {
  target.remove();
};

export { appendTarget, prependTarget, removeTarget };
