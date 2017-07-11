import { removeTarget } from '../sitewide';

let removeDirection = (btn) => {
  let ddLine = btn.target.parentNode.parentNode;

  removeTarget(ddLine);
};

export { removeDirection };
