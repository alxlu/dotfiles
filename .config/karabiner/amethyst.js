const fs = require("fs");
const path = require("path");

const karabinerFile = path.join(__dirname, "karabiner.json");
const karabinerJSON = JSON.parse(fs.readFileSync(karabinerFile));

const amethystSectionIndex = karabinerJSON.profiles
  .map(profile => profile.name)
  .indexOf("AmethystNav");

const amethystModSectionIndex = karabinerJSON.profiles
  .map(profile => profile.name)
  .indexOf("AmethystMod");

const addModifiers = (key, modifiers) => {
  return {
    from: {
      key_code: key,
      modifiers: {
        optional: "any"
      }
    },
    to: [
      {
        key_code: key,
        modifiers: modifiers
      }
    ],
    type: "basic"
  };
};

const addShiftModifiers = (key, keyModifiers, modifiers) => {
  return {
    from: {
      key_code: key,
      modifiers: {
        mandatory: keyModifiers,
        optional: "any"
      }
    },
    to: [
      {
        key_code: key,
        modifiers
      }
    ]
  };
};

const addCmdModifiers = ([key, to]) => {
  return {
    from: {
      key_code: key,
      modifiers: {
        optional: "any"
      }
    },
    to: [
      {
        key_code: to,
        modifiers: "left_command"
      }
    ],
    type: "basic"
  };
}

const addAmethystNavPrefix = key => {
  return addModifiers(key, ["left_shift", "left_option"]);
};

const addAmethystNavModPrefix = key => {
  return addShiftModifiers(
    key,
    ["shift"],
    ["left_control", "left_shift", "left_option"]
  );
};

const addSpaceNavPrefix = key => {
  return addModifiers(key, ["left_control"]);
};

const addAmethystModPrefix = key => {
  return addModifiers(key, ["left_control", "left_shift", "left_option"]);
};

const baseKeys = [
  "j",
  "k",
  "l",
  "h",
  "return_or_enter",
  "q",
  "w",
  "e",
  "r",
  "t",
  "y",
  "u",
  "i",
  "o",
  "p",
  "m",
  "[",
  "]",
  "comma",
  "period",
  "spacebar"
];

const spaceKeys = ["1", "2", "3", "4", "5"];
const cmdManipulators = [["x", "q"], ["c", "w"]].map(addCmdModifiers);

const navManipulators = baseKeys.map(addAmethystNavPrefix);
const spaceManipulators = spaceKeys.map(addSpaceNavPrefix);
const modManipulators = [...baseKeys, ...spaceKeys].map(addAmethystModPrefix);

const updateRules = (
  karabinerJSON,
  profileIndex,
  manipulators,
  description
) => {
  const rules =
    karabinerJSON.profiles[profileIndex].complex_modifications.rules;
  if (rules.length === 0) {
    rules.push({ description });
  }
  karabinerJSON.profiles[profileIndex].complex_modifications.rules = rules.map(
    rule => {
      return rule.description === description
        ? {
            description,
            manipulators
          }
        : rule;
    }
  );
};

updateRules(
  karabinerJSON,
  amethystSectionIndex,
  [...navManipulators, ...spaceManipulators, ...cmdManipulators],
  "Amethyst Nav"
);
updateRules(
  karabinerJSON,
  amethystModSectionIndex,
  modManipulators,
  "Amethyst Mod"
);

const result = JSON.stringify(karabinerJSON, null, 4);
fs.writeFileSync(karabinerFile, result);
